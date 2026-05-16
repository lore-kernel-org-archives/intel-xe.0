Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0518CCD4F21
	for <intel-xe@archiver.kernel.org>; Sat, 16 May 2026 07:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5AFE10E0D4;
	Sat, 16 May 2026 07:32:18 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAEBE10E0D4;
 Sat, 16 May 2026 07:32:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5959340606809024613=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/display=3A_fix_oops?=
 =?utf-8?q?_in_suspend/shutdown_without_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 16 May 2026 07:32:17 -0000
Message-ID: <177891673768.75062.5341542891962251293@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515160920.1082842-1-jani.nikula@intel.com>
In-Reply-To: <20260515160920.1082842-1-jani.nikula@intel.com>
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

--===============5959340606809024613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: fix oops in suspend/shutdown without display
URL   : https://patchwork.freedesktop.org/series/166671/
State : success

== Summary ==

CI Bug Log - changes from xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3_FULL -> xe-pw-166671v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-166671v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#2320])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2311])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6] ([Intel XE#2594])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7061])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2313])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#7915]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#7992])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][12] -> [ABORT][13] ([Intel XE#7914])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
    - shard-bmg:          [PASS][14] -> [ABORT][15] ([Intel XE#7914])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][16] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][18] ([Intel XE#6078]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [DMESG-FAIL][20] ([Intel XE#5208] / [Intel XE#5545] / [Intel XE#7774]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][22] ([Intel XE#5545] / [Intel XE#7774]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][24] ([Intel XE#301]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][26] ([Intel XE#7915]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-5/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][28] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-1/igt@kms_vrr@flipline.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-5/igt@kms_vrr@flipline.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][30] ([Intel XE#6321]) -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][32] ([Intel XE#7850]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-6/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [SKIP][34] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - shard-bmg:          [SKIP][36] ([Intel XE#6703]) -> [PASS][37] +133 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_intel_bb@intel-bb-blit-x.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_intel_bb@intel-bb-blit-x.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][38] ([Intel XE#6703]) -> [SKIP][39] ([Intel XE#1124]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][40] ([Intel XE#6703]) -> [SKIP][41] ([Intel XE#367])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][42] ([Intel XE#6703]) -> [SKIP][43] ([Intel XE#2887]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][44] ([Intel XE#6703]) -> [SKIP][45] ([Intel XE#2325] / [Intel XE#7358])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-bmg:          [SKIP][46] ([Intel XE#6703]) -> [SKIP][47] ([Intel XE#2252])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          [SKIP][48] ([Intel XE#6703]) -> [SKIP][49] ([Intel XE#2320])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][50] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][51] ([Intel XE#309] / [Intel XE#7343])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][52] ([Intel XE#6703]) -> [SKIP][53] ([Intel XE#2244])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][54] ([Intel XE#6703]) -> [SKIP][55] ([Intel XE#7178] / [Intel XE#7351])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][56] ([Intel XE#6703]) -> [SKIP][57] ([Intel XE#4141]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][58] ([Intel XE#6703]) -> [SKIP][59] ([Intel XE#2311]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][60] ([Intel XE#6703]) -> [SKIP][61] ([Intel XE#2313]) +12 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][62] ([Intel XE#6703]) -> [SKIP][63] ([Intel XE#7061])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][64] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][65] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][66] ([Intel XE#7916]) -> [SKIP][67] ([Intel XE#7915]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][68] ([Intel XE#6703]) -> [SKIP][69] ([Intel XE#7283])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][70] ([Intel XE#6703]) -> [SKIP][71] ([Intel XE#6814] / [Intel XE#7428])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_pm_rpm@package-g7.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#1489])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_psr@pr-suspend.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_psr@pr-suspend.html

  * igt@kms_sharpness_filter@filter-dpms:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#6503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_sharpness_filter@filter-dpms.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_sharpness_filter@filter-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][78] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][79] ([Intel XE#1729] / [Intel XE#7424])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-dpms:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#1499])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_vrr@flip-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_vrr@flip-dpms.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#7636]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_eudebug@basic-read-event.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#7140])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-bmg:          [SKIP][86] ([Intel XE#6703]) -> [SKIP][87] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_multi_queue@few-execs-dyn-priority:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#6874]) +7 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-dyn-priority.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][90] ([Intel XE#6703]) -> [SKIP][91] ([Intel XE#7138]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#7793])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_page_reclaim@random.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_page_reclaim@random.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#2284] / [Intel XE#7370])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [FAIL][97] ([Intel XE#7992]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992


Build changes
-------------

  * Linux: xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3 -> xe-pw-166671v1

  IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3: 25de7fb53bca724e7864b6bd8280aa1ec59429e3
  xe-pw-166671v1: 166671v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/index.html

--===============5959340606809024613==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: fix oops in suspend/shutdown without display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166671/">https://patchwork.freedesktop.org/series/166671/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3_FULL -&gt; xe-pw-166671v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166671v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-4/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@fair-allocation@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate@bd-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-1/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-5/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-1/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-5/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-6/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_intel_bb@intel-bb-blit-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> +133 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-9/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_sharpness_filter@filter-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_page_reclaim@random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166671v1/shard-bmg-8/igt@xe_pmu@fn-engine-activity-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3 -&gt; xe-pw-166671v1</li>
</ul>
<p>IGT_8917: 65d691069f26fc2a42c79e2364241320b85d48bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5068-25de7fb53bca724e7864b6bd8280aa1ec59429e3: 25de7fb53bca724e7864b6bd8280aa1ec59429e3<br />
  xe-pw-166671v1: 166671v1</p>

</body>
</html>

--===============5959340606809024613==--
