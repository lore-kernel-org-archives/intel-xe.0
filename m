Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BD0D2E9D1
	for <intel-xe@archiver.kernel.org>; Mon, 11 Nov 2024 10:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC66510E165;
	Mon, 11 Nov 2024 10:15:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FA110E165;
 Mon, 11 Nov 2024 10:15:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5911259559624236864=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Use_VRR_timing_generator_for_fi?=
 =?utf-8?q?xed_refresh_rate_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Nov 2024 10:15:26 -0000
Message-ID: <173132012661.2561525.18276307794998808964@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20241111091221.2992818-1-ankit.k.nautiyal@intel.com>
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

--===============5911259559624236864==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use VRR timing generator for fixed refresh rate modes
URL   : https://patchwork.freedesktop.org/series/141152/
State : failure

== Summary ==

CI Bug Log - changes from xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad_full -> xe-pw-141152v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141152v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141152v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141152v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@core_getversion@all-cards.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@core_getversion@all-cards.html

  
Known issues
------------

  Here are the changes found in xe-pw-141152v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4] ([Intel XE#2423])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@core_setmaster_vs_auth.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@core_setmaster_vs_auth.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2423] / [i915#2575]) +64 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][7] -> [SKIP][8] ([Intel XE#2351] / [Intel XE#2890]) +11 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2890]) +17 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#2446]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#1130]) +108 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][15] ([Intel XE#316]) -> [SKIP][16] ([Intel XE#2351] / [Intel XE#2890])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#316]) -> [SKIP][18] ([Intel XE#2890])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1124]) -> [SKIP][20] ([Intel XE#2890]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][21] ([Intel XE#1124]) -> [SKIP][22] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][23] ([Intel XE#367]) -> [SKIP][24] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][25] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][26] ([Intel XE#2351] / [Intel XE#2890]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][27] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][28] ([Intel XE#2890]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     [SKIP][29] ([Intel XE#306]) -> [SKIP][30] ([Intel XE#2423] / [i915#2575])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     [SKIP][31] ([Intel XE#373]) -> [SKIP][32] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][33] ([Intel XE#308]) -> [SKIP][34] ([Intel XE#2423] / [i915#2575])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][35] ([Intel XE#455]) -> [SKIP][36] ([Intel XE#2351])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_dsc@dsc-basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][37] ([Intel XE#703]) -> [SKIP][38] ([Intel XE#2423] / [i915#2575])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_feature_discovery@display-3x.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][39] ([Intel XE#455]) -> [SKIP][40] ([Intel XE#2890]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][41] ([Intel XE#651]) -> [SKIP][42] ([Intel XE#2890]) +12 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#651]) -> [SKIP][44] ([Intel XE#2351] / [Intel XE#2890]) +8 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#653]) -> [SKIP][46] ([Intel XE#2890]) +18 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][47] ([Intel XE#653]) -> [SKIP][48] ([Intel XE#2351] / [Intel XE#2890]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [FAIL][49] ([Intel XE#3312] / [Intel XE#3404]) -> [SKIP][50] ([Intel XE#2423] / [i915#2575])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][51] ([Intel XE#346]) -> [SKIP][52] ([Intel XE#2890])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][53] ([Intel XE#356]) -> [SKIP][54] ([Intel XE#2423] / [i915#2575])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-dg2-set2:     [DMESG-WARN][55] -> [SKIP][56] ([Intel XE#2423] / [i915#2575])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][57] ([Intel XE#1129]) -> [SKIP][58] ([Intel XE#2890])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#908]) -> [SKIP][60] ([Intel XE#2890])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][61] ([Intel XE#1489]) -> [SKIP][62] ([Intel XE#2890]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][64] ([Intel XE#2890]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#3414]) -> [SKIP][66] ([Intel XE#2423] / [i915#2575])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#455]) -> [SKIP][68] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#2168]) -> [SKIP][70] ([Intel XE#2423] / [i915#2575])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_vrr@lobf.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#756]) -> [SKIP][72] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][74] ([Intel XE#1130])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#2905]) -> [SKIP][76] ([Intel XE#1130]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][77] ([Intel XE#1600]) -> [SKIP][78] ([Intel XE#1130])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     [SKIP][79] ([Intel XE#288]) -> [SKIP][80] ([Intel XE#1130]) +16 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#2360]) -> [SKIP][82] ([Intel XE#1130]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#2541]) -> [SKIP][84] ([Intel XE#1130]) +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_oa@map-oa-buffer.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_oa@map-oa-buffer.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#979]) -> [SKIP][86] ([Intel XE#1130])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][88] ([Intel XE#1130])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#944]) -> [SKIP][90] ([Intel XE#1130])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#3342]) -> [SKIP][92] ([Intel XE#1130])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#2922]) -> [SKIP][94] ([Intel XE#1130])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_tlb@basic-tlb.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_tlb@basic-tlb.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][95] ([Intel XE#2919]) -> [SKIP][96] ([Intel XE#1130])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad -> xe-pw-141152v1

  IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad: b69d9ffb08bcd3a2810da52a79114661097d23ad
  xe-pw-141152v1: 141152v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html

--===============5911259559624236864==
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
<tr><td><b>Series:</b></td><td>Use VRR timing generator for fixed refresh rate modes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141152/">https://patchwork.freedesktop.org/series/141152/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad_full -&gt; xe-pw-141152v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141152v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141152v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141152v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_getversion@all-cards:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@core_getversion@all-cards.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141152v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@core_setmaster_vs_auth.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@core_setmaster_vs_auth.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +108 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_hdr@brightness-with-hdr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3312">Intel XE#3312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3404">Intel XE#3404</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_plane_lowres@tiling-x.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890">Intel XE#2890</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_evict@evict-beng-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v1/shard-dg2-434/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad -&gt; xe-pw-141152v1</li>
</ul>
<p>IGT_8102: a05b40911bfb79c9bdf6ff7e8ab1a68948afbbf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2200-b69d9ffb08bcd3a2810da52a79114661097d23ad: b69d9ffb08bcd3a2810da52a79114661097d23ad<br />
  xe-pw-141152v1: 141152v1</p>

</body>
</html>

--===============5911259559624236864==--
