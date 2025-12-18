Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD2D68BC9
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 01:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2090710E4C9;
	Thu, 18 Dec 2025 01:36:16 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AF1010E414;
 Thu, 18 Dec 2025 01:36:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1909723631231904160=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_SRIOV_scheduler_?=
 =?utf-8?q?groups_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 01:36:14 -0000
Message-ID: <176602177412.98733.5235102914482064581@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
In-Reply-To: <20251217012620.758252-15-daniele.ceraolospurio@intel.com>
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

--===============1909723631231904160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce SRIOV scheduler groups (rev4)
URL   : https://patchwork.freedesktop.org/series/158142/
State : failure

== Summary ==

CI Bug Log - changes from xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0_FULL -> xe-pw-158142v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158142v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158142v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158142v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-bmg:          [SKIP][3] ([Intel XE#6703]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          [SKIP][5] ([Intel XE#2925] / [Intel XE#346]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          [SKIP][7] ([Intel XE#2925] / [Intel XE#2927]) -> [SKIP][8] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][9] ([Intel XE#3012] / [Intel XE#6590]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][11] ([Intel XE#2934] / [Intel XE#6590]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-lnl:          [SKIP][13] ([Intel XE#2925]) -> [SKIP][14] +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][15] ([Intel XE#6703]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  
Known issues
------------

  Here are the changes found in xe-pw-158142v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#6779])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2134]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@fbdev@nullptr.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#4665])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@intel_hwmon@hwmon-write.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d@basic:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6011])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-5/igt@kms_3d@basic.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#1124]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2325])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6507])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6705])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][35] ([Intel XE#6707])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2321])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#2291])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2286])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1340])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2244]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4422])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#776])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2373])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2316])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2316]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#5352]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2293]) +7 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#656]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2311]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#651]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +13 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2312]) +9 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][59] ([Intel XE#6740]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2393])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#4596])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#5020])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#6886]) +8 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2391])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#6693]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_pm_rpm@basic-rte.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#6693])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6814])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1406] / [Intel XE#2387])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_psr@fbc-psr-basic.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2330])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2413])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1435])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#6503]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#1499])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_vrr@flip-basic.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#6010])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-5/igt@xe_configfs@survivability-mode.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#4837]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#4837])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#4837] / [Intel XE#6665])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#6665])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6665] / [Intel XE#6681])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#4837] / [Intel XE#6665]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_eudebug_online@single-step.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#688])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1392])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2322]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6874])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6874]) +24 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#5007])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html

  * igt@xe_exec_system_allocator@many-malloc-bo-unmap:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#6557] / [Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@once-mmap-race-nomemset:
    - shard-bmg:          [PASS][94] -> [SKIP][95] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#4943]) +8 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#4943]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#6703]) +236 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#6703]) +507 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#2284])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#6251]) +2 other tests fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#944]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][105] ([Intel XE#6779]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][107] ([Intel XE#2134]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@fbdev@eof.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@fbdev@eof.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][109] ([Intel XE#2291]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [FAIL][111] ([Intel XE#4633]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][113] ([Intel XE#2316]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2:
    - shard-bmg:          [FAIL][115] ([Intel XE#3149] / [Intel XE#5352]) -> [PASS][116] +1 other test pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][117] ([Intel XE#301]) -> [PASS][118] +2 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [ABORT][119] ([Intel XE#6740]) -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [SKIP][121] ([Intel XE#1406] / [Intel XE#4692]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [PASS][124] +350 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][125] ([Intel XE#5625]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - shard-bmg:          [SKIP][127] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][128] +4 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [FAIL][129] ([Intel XE#6251]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#2327]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][133] ([Intel XE#2327]) -> [SKIP][134] ([Intel XE#6703]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][135] ([Intel XE#1124]) -> [SKIP][136] ([Intel XE#6703]) +11 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#1124]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2314] / [Intel XE#2894])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [SKIP][141] ([Intel XE#367]) -> [SKIP][142] ([Intel XE#6703]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][143] ([Intel XE#6703]) -> [SKIP][144] ([Intel XE#367])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#2887]) +10 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][147] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][148] ([Intel XE#6703]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][149] ([Intel XE#3432]) -> [SKIP][150] ([Intel XE#6703]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#2652] / [Intel XE#787])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#3432]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][155] ([Intel XE#2887]) -> [SKIP][156] ([Intel XE#6703]) +12 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#2325]) +4 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][159] ([Intel XE#2252]) -> [SKIP][160] ([Intel XE#6703]) +10 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][161] ([Intel XE#6703]) -> [SKIP][162] ([Intel XE#2252]) +3 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][163] ([Intel XE#6743]) -> [SKIP][164] ([Intel XE#6703])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][165] ([Intel XE#2390]) -> [SKIP][166] ([Intel XE#6703]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [SKIP][168] ([Intel XE#2341])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_content_protection@mei-interface.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [FAIL][170] ([Intel XE#6707])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_content_protection@uevent.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][171] ([Intel XE#2320]) -> [SKIP][172] ([Intel XE#6703]) +4 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          [SKIP][173] ([Intel XE#2321]) -> [SKIP][174] ([Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][175] ([Intel XE#6703]) -> [SKIP][176] ([Intel XE#2320]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][177] ([Intel XE#2320]) -> [SKIP][178] ([Intel XE#6557] / [Intel XE#6703])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][179] ([Intel XE#6703]) -> [SKIP][180] ([Intel XE#2291])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][181] ([Intel XE#2291]) -> [SKIP][182] ([Intel XE#6703]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][183] ([Intel XE#2286]) -> [SKIP][184] ([Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][185] ([Intel XE#6703]) -> [SKIP][186] ([Intel XE#1508])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][187] ([Intel XE#2244]) -> [SKIP][188] ([Intel XE#6703])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][189] ([Intel XE#4422]) -> [SKIP][190] ([Intel XE#6703])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#776])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fbcon_fbt@psr.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#1138])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_feature_discovery@display-4x.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][195] ([Intel XE#2374]) -> [SKIP][196] ([Intel XE#6703])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_feature_discovery@psr1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [SKIP][197] ([Intel XE#2316]) -> [SKIP][198] ([Intel XE#6703]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][199] ([Intel XE#6703]) -> [SKIP][200] ([Intel XE#2316]) +4 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][201] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][202] ([Intel XE#6703]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][205] ([Intel XE#2311]) -> [SKIP][206] ([Intel XE#6703]) +20 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][207] ([Intel XE#2311]) -> [SKIP][208] ([Intel XE#6557] / [Intel XE#6703])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][209] ([Intel XE#2311]) -> [SKIP][210] ([Intel XE#2312]) +4 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#2311]) +12 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][213] ([Intel XE#2312]) -> [SKIP][214] ([Intel XE#4141]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][215] ([Intel XE#4141]) -> [SKIP][216] ([Intel XE#2312]) +3 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#4141]) -> [SKIP][218] ([Intel XE#6703]) +8 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][219] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][220] ([Intel XE#2312])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][221] ([Intel XE#6703]) -> [SKIP][222] ([Intel XE#4141]) +6 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#2312]) +9 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2312]) -> [SKIP][226] ([Intel XE#2311]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][227] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][228] ([Intel XE#2311])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][229] ([Intel XE#2312]) -> [SKIP][230] ([Intel XE#2313]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][231] ([Intel XE#2312]) -> [SKIP][232] ([Intel XE#6703]) +10 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][233] ([Intel XE#6703]) -> [SKIP][234] ([Intel XE#2352])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][235] ([Intel XE#2350]) -> [SKIP][236] ([Intel XE#6703])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][237] ([Intel XE#6703]) -> [SKIP][238] ([Intel XE#2313]) +17 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2313]) -> [SKIP][240] ([Intel XE#6703]) +26 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][241] ([Intel XE#2313]) -> [SKIP][242] ([Intel XE#2312]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][243] ([Intel XE#6740]) -> [SKIP][244] ([Intel XE#6703])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][245] ([Intel XE#3544]) -> [SKIP][246] ([Intel XE#3374] / [Intel XE#3544])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [ABORT][247] ([Intel XE#6740]) -> [SKIP][248] ([Intel XE#1503])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-lnl:          [SKIP][249] ([Intel XE#2925]) -> [SKIP][250] ([Intel XE#4298])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-5/igt@kms_joiner@basic-max-non-joiner.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][251] ([Intel XE#6703]) -> [SKIP][252] ([Intel XE#5624])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][253] ([Intel XE#2393]) -> [SKIP][254] ([Intel XE#6703])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][255] ([Intel XE#4596]) -> [SKIP][256] ([Intel XE#6703])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][257] ([Intel XE#6703]) -> [SKIP][258] ([Intel XE#5020])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][259] ([Intel XE#6703]) -> [SKIP][260] ([Intel XE#6886])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][261] ([Intel XE#6886]) -> [SKIP][262] ([Intel XE#6703]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][263] ([Intel XE#2938]) -> [SKIP][264] ([Intel XE#6703])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][265] ([Intel XE#6703]) -> [SKIP][266] ([Intel XE#3309])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][267] ([Intel XE#6703]) -> [SKIP][268] ([Intel XE#2505])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][269] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][270] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][271] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][272] ([Intel XE#1406] / [Intel XE#6703]) +8 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][273] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][274] ([Intel XE#1406] / [Intel XE#2387])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][275] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][276] ([Intel XE#1406] / [Intel XE#6703])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-dpms:
    - shard-bmg:          [SKIP][277] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][278] ([Intel XE#1406] / [Intel XE#6703]) +10 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_psr@fbc-psr-dpms.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr@fbc-psr-dpms.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          [SKIP][279] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][280] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr@psr-basic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][281] ([Intel XE#6703]) -> [SKIP][282] ([Intel XE#1435])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][283] ([Intel XE#6503]) -> [SKIP][284] ([Intel XE#6703]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_sharpness_filter@filter-rotations.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][285] ([Intel XE#2426]) -> [SKIP][286] ([Intel XE#6703])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][287] ([Intel XE#2168]) -> [SKIP][288] ([Intel XE#6703])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_vrr@lobf.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          [SKIP][289] ([Intel XE#1499]) -> [SKIP][290] ([Intel XE#6703])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][291] -> [SKIP][292] ([Intel XE#6703])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@testdisplay.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@testdisplay.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][293] ([Intel XE#6703]) -> [SKIP][294] ([Intel XE#6599])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_compute@eu-busy-10s.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_compute@eu-busy-10s.html

  * igt@xe_eudebug@basic-client-th:
    - shard-bmg:          [SKIP][295] ([Intel XE#6703]) -> [SKIP][296] ([Intel XE#4837]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug@basic-client-th.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          [SKIP][297] ([Intel XE#4837]) -> [SKIP][298] ([Intel XE#6703]) +5 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_eudebug@connect-user.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug_online@pagefault-read-stress:
    - shard-bmg:          [SKIP][299] ([Intel XE#6703]) -> [SKIP][300] ([Intel XE#6665] / [Intel XE#6681])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_eudebug_online@pagefault-read-stress.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          [SKIP][301] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][302] ([Intel XE#6703]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
    - shard-bmg:          [SKIP][303] ([Intel XE#6703]) -> [SKIP][304] ([Intel XE#4837] / [Intel XE#6665]) +2 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][305] ([Intel XE#2322]) -> [SKIP][306] ([Intel XE#6703]) +5 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          [SKIP][307] ([Intel XE#6703]) -> [SKIP][308] ([Intel XE#2322]) +4 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          [SKIP][309] ([Intel XE#6703]) -> [SKIP][310] ([Intel XE#6874]) +19 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][311] ([Intel XE#6874]) -> [SKIP][312] ([Intel XE#6703]) +32 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][313] ([Intel XE#5007]) -> [SKIP][314] ([Intel XE#6703])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][315] ([Intel XE#4943]) -> [SKIP][316] ([Intel XE#6703]) +13 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][317] ([Intel XE#6703]) -> [SKIP][318] ([Intel XE#4943]) +18 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][319] ([Intel XE#6703]) -> [SKIP][320] ([Intel XE#6281])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [SKIP][321] ([Intel XE#6703]) -> [ABORT][322] ([Intel XE#5466])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][323] ([Intel XE#6703]) -> [SKIP][324] ([Intel XE#2236])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][325] ([Intel XE#6703]) -> [SKIP][326] ([Intel XE#5694])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][327] ([Intel XE#5742]) -> [SKIP][328] ([Intel XE#6703])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pm@d3hot-i2c.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][329] ([Intel XE#2284]) -> [SKIP][330] ([Intel XE#6703])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][331] ([Intel XE#4733]) -> [SKIP][332] ([Intel XE#6703]) +3 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          [SKIP][333] ([Intel XE#6703]) -> [SKIP][334] ([Intel XE#4733])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][335] ([Intel XE#6703]) -> [SKIP][336] ([Intel XE#944]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][337] ([Intel XE#944]) -> [SKIP][338] ([Intel XE#6703]) +1 other test skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6011]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8668 -> IGT_8669
  * Linux: xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0 -> xe-pw-158142v4

  IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b715c179424dafd8e0
  xe-pw-158142v4: 158142v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/index.html

--===============1909723631231904160==
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
<tr><td><b>Series:</b></td><td>Introduce SRIOV scheduler groups (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158142/">https://patchwork.freedesktop.org/series/158142/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0_FULL -&gt; xe-pw-158142v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158142v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158142v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158142v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158142v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@intel_hwmon@hwmon-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_3d@basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-5/igt@kms_3d@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6011">Intel XE#6011</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705">Intel XE#6705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_crc@cursor-random-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_pm_rpm@basic-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-5/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_eudebug_online@pagefault-write-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-malloc-bo-unmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-large-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +236 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +507 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@core_hotunplug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_flip@absolute-wf_vblank-interruptible@d-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_hdr@bpc-switch-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new.html">PASS</a> +350 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_hdr@bpc-switch-dpms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-lnl-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-lnl-2/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_psr@fbc-psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@testdisplay.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-4/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_eudebug@basic-client-th.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-4/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_eudebug@connect-user.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-1/igt@xe_eudebug_online@pagefault-read-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-8/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158142v4/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8668 -&gt; IGT_8669</li>
<li>Linux: xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0 -&gt; xe-pw-158142v4</li>
</ul>
<p>IGT_8668: 906681747a312ef11ef9af8ab1fa6eff28b4cbd0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8669: 319db2ffba419f9711acc72895f065a818905efa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4255-2eb2f8746a879f1c0e4c56b715c179424dafd8e0: 2eb2f8746a879f1c0e4c56b715c179424dafd8e0<br />
  xe-pw-158142v4: 158142v4</p>

</body>
</html>

--===============1909723631231904160==--
