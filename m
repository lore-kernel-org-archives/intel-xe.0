Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3729BCD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 22:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA9A410E4AA;
	Thu, 30 Apr 2026 22:41:13 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B5E10E4AA;
 Thu, 30 Apr 2026 22:41:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6293156724348783447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Intel_Xe_GPU_Debug_Support?=
 =?utf-8?q?_=28eudebug=29_v8?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Apr 2026 22:41:12 -0000
Message-ID: <177758887260.31040.4386770315945629961@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20260430105121.712843-1-mika.kuoppala@linux.intel.com>
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

--===============6293156724348783447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe GPU Debug Support (eudebug) v8
URL   : https://patchwork.freedesktop.org/series/165777/
State : failure

== Summary ==

CI Bug Log - changes from xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d_FULL -> xe-pw-165777v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165777v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165777v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165777v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_eudebug_online@interrupt-all@drm_xe_engine_class_compute0:
    - shard-bmg:          NOTRUN -> [FAIL][1] +39 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-all@drm_xe_engine_class_compute0.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +1822 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck:
    - shard-lnl:          NOTRUN -> [FAIL][5] +156 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@twice-new-prefetch:
    - shard-lnl:          [PASS][6] -> [FAIL][7] +1611 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_exec_system_allocator@twice-new-prefetch.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_exec_system_allocator@twice-new-prefetch.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Warnings ####

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][9] ([Intel XE#7636]) -> [FAIL][10] +7 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          [SKIP][11] ([Intel XE#7636]) -> [FAIL][12] +8 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][13] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudebug_sriov@deny-eudebug.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][15] ([Intel XE#7098]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  
Known issues
------------

  Here are the changes found in xe-pw-165777v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1125] / [Intel XE#7312])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#3658] / [Intel XE#7360])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7676])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2669] / [Intel XE#7389]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#373]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#306] / [Intel XE#7358]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][31] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2321] / [Intel XE#7355])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424]) +4 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2244])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#4422] / [Intel XE#7442])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1421]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7178] / [Intel XE#7349])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1397] / [Intel XE#7385]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7179])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6312])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2311])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#5812] / [Intel XE#656]) +17 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1469] / [Intel XE#7399])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2313])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1470])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#1503])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6911] / [Intel XE#7466])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#6900] / [Intel XE#7362])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7283])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#7130]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7283]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#599])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7376] / [Intel XE#870])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6813])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#1489]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4608]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#7345]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1406] / [Intel XE#4609]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#330] / [Intel XE#5857])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [FAIL][70] ([Intel XE#7717])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#7709])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@connect-user:
    - shard-lnl:          NOTRUN -> [FAIL][72] ([Intel XE#7708])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [FAIL][73] ([Intel XE#7718])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug_online@pagefault-read-stress@drm_xe_engine_class_render0:
    - shard-lnl:          NOTRUN -> [FAIL][74] ([Intel XE#7707]) +20 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@pagefault-read-stress@drm_xe_engine_class_render0.html

  * igt@xe_eudebug_online@stopped-thread@drm_xe_engine_class_compute0:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#7707]) +25 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thread@drm_xe_engine_class_compute0.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram@drm_xe_engine_class_compute0:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#2825]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram@drm_xe_engine_class_compute0.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram@drm_xe_engine_class_compute0:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2825] / [Intel XE#7430]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram@drm_xe_engine_class_compute0.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#6540] / [Intel XE#688]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@once-parallel-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#7482]) +9 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_balancer@once-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1392]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2322] / [Intel XE#7372])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#7136]) +8 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#7136]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#6874]) +13 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6874]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy@drm_xe_engine_class_render0:
    - shard-lnl:          NOTRUN -> [FAIL][86] ([Intel XE#7715]) +7 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy@drm_xe_engine_class_render0.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip@drm_xe_engine_class_compute0:
    - shard-bmg:          NOTRUN -> [FAIL][87] ([Intel XE#7715]) +7 other tests fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_sip_eudebug@breakpoint-writesip@drm_xe_engine_class_compute0.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#7138]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#7138]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114]) -> ([PASS][115], [SKIP][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139]) ([Intel XE#378] / [Intel XE#7405])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-6/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#6964]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#7793]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-lnl:          NOTRUN -> [SKIP][142] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#7590] / [Intel XE#977])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2284] / [Intel XE#7370])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#584] / [Intel XE#7369])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#944])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#7174])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#4351] / [Intel XE#7357])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_sriov_vram@vf-access-after-resize-down.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][150] -> [DMESG-WARN][151] ([Intel XE#6627] / [Intel XE#7419])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@xe_survivability@runtime-survivability.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#5745])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][153] ([Intel XE#7571]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][155] ([Intel XE#3321]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][157] ([Intel XE#301]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          [FAIL][159] ([Intel XE#4227]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#2142]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          [SKIP][163] ([Intel XE#7636]) -> [PASS][164] +2 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][165] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-bmg:          [INCOMPLETE][167] -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][169] ([Intel XE#6321]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-lnl:          [SKIP][171] ([Intel XE#7636]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][173] ([Intel XE#2833]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_live_ktest@xe_eudebug.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_live_ktest@xe_eudebug.html
    - shard-bmg:          [SKIP][175] ([Intel XE#2833]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][177] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][178] ([Intel XE#3544])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][179] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][180] ([Intel XE#2426] / [Intel XE#5848])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][181] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][182] ([Intel XE#2509] / [Intel XE#7437])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-close:
    - shard-lnl:          [SKIP][183] ([Intel XE#7636]) -> [FAIL][184] ([Intel XE#7716])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_eudebug@basic-close.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_eudebug@basic-close.html
    - shard-bmg:          [SKIP][185] ([Intel XE#7636]) -> [FAIL][186] ([Intel XE#7716])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudebug@basic-close.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-4/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-bmg:          [SKIP][187] ([Intel XE#7636]) -> [FAIL][188] ([Intel XE#7717])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_eudebug@basic-connect.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          [SKIP][189] ([Intel XE#7636]) -> [FAIL][190] ([Intel XE#7709]) +6 other tests fail
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudebug@basic-read-event.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-lnl:          [SKIP][191] ([Intel XE#7636]) -> [FAIL][192] ([Intel XE#7707]) +31 other tests fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudebug@basic-vm-access-faultable.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-lnl:          [SKIP][193] ([Intel XE#7636]) -> [FAIL][194] ([Intel XE#7709]) +7 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@connect-user:
    - shard-bmg:          [SKIP][195] ([Intel XE#7636]) -> [FAIL][196] ([Intel XE#7708])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudebug@connect-user.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-7/igt@xe_eudebug@connect-user.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][197] ([Intel XE#7636]) -> [FAIL][198] ([Intel XE#7718]) +1 other test fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudebug@discovery-empty.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@discovery-empty.html
    - shard-lnl:          [SKIP][199] ([Intel XE#7636]) -> [FAIL][200] ([Intel XE#7718])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_eudebug@discovery-empty.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          [SKIP][201] ([Intel XE#7636]) -> [FAIL][202] ([Intel XE#7753]) +1 other test fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudebug@discovery-race-sigint.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          [SKIP][203] ([Intel XE#7636]) -> [FAIL][204] ([Intel XE#7753]) +2 other tests fail
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@xe_eudebug@discovery-race-vmbind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-10/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          [SKIP][205] ([Intel XE#7636]) -> [SKIP][206] ([Intel XE#3894]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudebug@multigpu-basic-client.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          [SKIP][207] ([Intel XE#7636]) -> [SKIP][208] ([Intel XE#5132]) +1 other test skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_eudebug@multigpu-basic-client-many.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@sysfs-toggle:
    - shard-lnl:          [SKIP][209] ([Intel XE#7636]) -> [FAIL][210] ([Intel XE#7720])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudebug@sysfs-toggle.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eudebug@sysfs-toggle.html
    - shard-bmg:          [SKIP][211] ([Intel XE#7636]) -> [FAIL][212] ([Intel XE#7720])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@xe_eudebug@sysfs-toggle.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/igt@xe_eudebug@sysfs-toggle.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][213] ([Intel XE#7636]) -> [FAIL][214] ([Intel XE#7723]) +3 other tests fail
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-lnl:          [SKIP][215] ([Intel XE#7636]) -> [FAIL][216] ([Intel XE#7723]) +3 other tests fail
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudebug@vm-bind-clear-faultable.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          [SKIP][217] ([Intel XE#7636]) -> [FAIL][218] ([Intel XE#7754])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
    - shard-lnl:          [SKIP][219] ([Intel XE#7636]) -> [FAIL][220] ([Intel XE#7754])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          [SKIP][221] ([Intel XE#7636]) -> [SKIP][222] ([Intel XE#2846])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
    - shard-lnl:          [SKIP][223] ([Intel XE#7636]) -> [SKIP][224] ([Intel XE#2846])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][225] ([Intel XE#7636]) -> [FAIL][226] ([Intel XE#7707]) +41 other tests fail
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-lnl:          [SKIP][227] ([Intel XE#7636]) -> [SKIP][228] ([Intel XE#2825] / [Intel XE#7430]) +3 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-lnl:          [SKIP][229] ([Intel XE#7636]) -> [SKIP][230] ([Intel XE#2825]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          [SKIP][231] ([Intel XE#7636]) -> [FAIL][232] ([Intel XE#7715]) +3 other tests fail
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
    - shard-bmg:          [SKIP][233] ([Intel XE#7636]) -> [FAIL][234] ([Intel XE#7715]) +3 other tests fail
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3894
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5132
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7312
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7357
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7430
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7676
  [Intel XE#7707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7707
  [Intel XE#7708]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7708
  [Intel XE#7709]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7709
  [Intel XE#7715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7715
  [Intel XE#7716]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7716
  [Intel XE#7717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7717
  [Intel XE#7718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7718
  [Intel XE#7720]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7720
  [Intel XE#7723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7723
  [Intel XE#7753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7753
  [Intel XE#7754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7754
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -> xe-pw-165777v1

  IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f4cc28fb18a8aba76d
  xe-pw-165777v1: 165777v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/index.html

--===============6293156724348783447==
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
<tr><td><b>Series:</b></td><td>Intel Xe GPU Debug Support (eudebug) v8</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165777/">https://patchwork.freedesktop.org/series/165777/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-165777v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-165777v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a=
8aba76d_FULL -&gt; xe-pw-165777v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165777v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-165777v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1657=
77v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_eudebug_online@interrupt-all@drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-a=
ll@drm_xe_engine_class_compute0.html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_reset@cm-multi-queue-=
cat-error-on-secondary.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg=
-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">FA=
IL</a> +1822 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap=
-eocheck:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-remap-dontunmap-eocheck.html">FAIL</a> +156 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-new-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_exec_=
system_allocator@twice-new-prefetch.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_exec_s=
ystem_allocator@twice-new-prefetch.html">FAIL</a> +1611 other tests fail</l=
i>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vra=
m-lr-defer.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-10/igt@xe_eude=
bug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-=
5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">FAIL</a> +7 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudeb=
ug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-ln=
l-1/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">FAIL</a> +8 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1657=
77v1/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_exec_=
system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">FA=
IL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165777v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
25">Intel XE#1125</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7312">Intel XE#7312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_bw@linear-tiling-3-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_bw@linear-tiling-4-displa=
ys-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7676">Intel XE#7676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_ccs@bad-rotation-90-4-til=
ed-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_chamelium_audio@dp-audio-=
edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_chamelium_frames@hdmi-asp=
ect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1424">Intel XE#1424</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_cursor_legacy@2x-long-fli=
p-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">I=
ntel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE=
#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-p016=
-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-165777v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">In=
tel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane@pixel-format-yf-til=
ed-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane_lowres@tiling-yf.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/737=
6">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_pm_rpm@package-g7.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/681=
3">Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7=
304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7345">Intel XE#7345</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@kms_tv_load_detect@load-detec=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/330">Intel XE#330</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eudebug@basic-connect.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7717">Intel XE#7717</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-disc=
overy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7709">Intel XE#7709</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug@connect-user.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
708">Intel XE#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_eudebug@discovery-empty-cl=
ients.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7718">Intel XE#7718</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-read-stress@drm_xe_engine_class_render0:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@pagefault-r=
ead-stress@drm_xe_engine_class_render0.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7707">Intel XE#7707</a>) +20 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread@drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/igt@xe_eudebug_online@stopped-thr=
ead@drm_xe_engine_class_compute0.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7707">Intel XE#7707</a>) +25 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram@drm_xe_eng=
ine_class_compute0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-vram@drm_xe_engine_class_compute0.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825">Intel X=
E#2825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram@drm_xe_eng=
ine_class_compute0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-vram-target-sram@drm_xe_engine_class_compute0.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825">Intel X=
E#2825</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7430">Intel XE#7430</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_balancer@once-paralle=
l-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_exec_multi_queue@two-queue=
s-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy@drm_xe_engine_class_ren=
der0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_exec_sip_eudebug@breakpoin=
t-waitsip-heavy@drm_xe_engine_class_render0.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7715">Intel XE#7715</a>) +7=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip@drm_xe_engine_class_compute0=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_sip_eudebug@breakpoin=
t-writesip@drm_xe_engine_class_compute0.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7715">Intel XE#7715</a>) +7 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_exec_threads@threads-multi=
-queue-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8ab=
a76d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18=
a8aba76d/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28=
fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4=
cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d51=
43f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f272cc=
4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf64f2=
72cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac514cf=
64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-3ac5=
14cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4959-=
3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165777v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165777v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165777v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_multigpu_svm@mgpu-migratio=
n-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_page_reclaim@binds-null-vm=
a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_pat@pat-index-xehpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
20">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/759=
0">Intel XE#7590</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-prefetch.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_query@multigpu-query-topol=
ogy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@bulk-exec-quantum-vfs-disabled:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_sriov_admin@bulk-exec-quan=
tum-vfs-disabled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7174">Intel XE#7174</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7357">Intel XE#7357</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_sriov_vram@vf-access-after=
-resize-down.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@xe_survivabili=
ty@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_vm@out-of-memory.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745"=
>Intel XE#5745</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
165777v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shar=
d-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@kms_vrr@=
max-min@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@kms_vrr@ma=
x-min@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-l=
nl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-4/igt@xe_eudeb=
ug@basic-exec-queues-enable.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-8/igt@xe_=
eudebug@basic-exec-queues-enable.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1=
/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_evict=
@evict-beng-large-multi-vm-cm.html">INCOMPLETE</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_evict@=
evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shar=
d-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_exec_=
sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/i=
gt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-3/igt@xe_live_ktest@=
xe_eudebug.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_live_ktest@=
xe_eudebug.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shar=
d-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165777v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_eudeb=
ug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/igt@xe_eudebug@basic=
-close.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7716">Intel XE#7716</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudeb=
ug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-4/igt@xe_eudebug@basic=
-close.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7716">Intel XE#7716</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_eudeb=
ug@basic-connect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@bas=
ic-connect.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7717">Intel XE#7717</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudeb=
ug@basic-read-event.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug@=
basic-read-event.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7709">Intel XE#7709</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudeb=
ug@basic-vm-access-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-1/igt@xe=
_eudebug@basic-vm-access-faultable.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7707">Intel XE#7707</a>) +31 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-1/igt@xe_eudeb=
ug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-7/i=
gt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7709">Intel XE#7709</a>) +=
7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@connect-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-5/igt@xe_eudeb=
ug@connect-user.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-7/igt@xe_eudebug@conn=
ect-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7708">Intel XE#7708</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudeb=
ug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-1/igt@xe_eudebug@d=
iscovery-empty.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7718">Intel XE#7718</a>) +1 other test fail</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-8/igt@xe_eudeb=
ug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-5/igt@xe_eudebug@d=
iscovery-empty.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7718">Intel XE#7718</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudeb=
ug@discovery-race-sigint.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eud=
ebug@discovery-race-sigint.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7753">Intel XE#7753</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@xe_eudeb=
ug@discovery-race-vmbind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-10/igt@xe_eu=
debug@discovery-race-vmbind.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7753">Intel XE#7753</a>) +2 other tests fai=
l</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudeb=
ug@multigpu-basic-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eud=
ebug@multigpu-basic-client.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3894">Intel XE#3894</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_eudeb=
ug@multigpu-basic-client-many.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/igt@x=
e_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5132">Intel XE#5132</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@sysfs-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudeb=
ug@sysfs-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-8/igt@xe_eudebug@sysf=
s-toggle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7720">Intel XE#7720</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-8/igt@xe_eudeb=
ug@sysfs-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-6/igt@xe_eudebug@sysf=
s-toggle.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7720">Intel XE#7720</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-1/igt@xe_eudeb=
ug@vm-bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/igt@xe_eudebug@vm-=
bind-clear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7723">Intel XE#7723</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-4/igt@xe_eudeb=
ug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-2/igt@xe_e=
udebug@vm-bind-clear-faultable.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7723">Intel XE#7723</a>) +3 other tests =
fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-6/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/=
shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7754">Intel XE#7754</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-3/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-single-tile.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/=
shard-lnl-2/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7754">Intel XE#7754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-7/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-=
bmg-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846">Intel =
XE#2846</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_eudeb=
ug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-=
lnl-5/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846">Intel =
XE#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-2/igt@xe_eudeb=
ug_online@set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-2/=
igt@xe_eudebug_online@set-breakpoint-faultable.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7707">Intel XE#7707</a>)=
 +41 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-7/igt@xe_eudeb=
ug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1657=
77v1/shard-lnl-3/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-s=
ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2825">Intel XE#2825</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7430">Intel XE#7430</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-2/igt@xe_eudeb=
ug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1657=
77v1/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-v=
ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2825">Intel XE#2825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-lnl-5/igt@xe_exec_=
sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-lnl-4/ig=
t@xe_exec_sip_eudebug@breakpoint-writesip.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7715">Intel XE#7715</a>) +3 o=
ther tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d/shard-bmg-9/igt@xe_exec_=
sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165777v1/shard-bmg-9/ig=
t@xe_exec_sip_eudebug@breakpoint-writesip.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7715">Intel XE#7715</a>) +3 o=
ther tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d -&gt; xe-pw-165=
777v1</li>
</ul>
<p>IGT_8879: 02b0e01dd9a5a3ab1efe976bb8c4f13cfcdbab1a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4959-3ac514cf64f272cc4d5143f4cc28fb18a8aba76d: 3ac514cf64f272cc4d5143f=
4cc28fb18a8aba76d<br />
  xe-pw-165777v1: 165777v1</p>

</body>
</html>

--===============6293156724348783447==--
