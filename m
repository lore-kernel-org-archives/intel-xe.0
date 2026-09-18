Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA55DC982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 22:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665DA10E40C;
	Fri, 18 Sep 2026 22:38:03 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D507B10E1A1;
 Fri, 18 Sep 2026 22:38:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3889520330001429118=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/vm=3A_nuke_PTs_only?=
 =?utf-8?q?_after_unlinking_contested_VMAs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 22:38:01 -0000
Message-ID: <178977108185.183660.1571723535110464533@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260918131034.598078-2-matthew.auld@intel.com>
In-Reply-To: <20260918131034.598078-2-matthew.auld@intel.com>
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

--===============3889520330001429118==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: nuke PTs only after unlinking contested VMAs
URL   : https://patchwork.freedesktop.org/series/174512/
State : failure

== Summary ==

CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05_FULL -> xe-pw-174512v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-174512v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-174512v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-174512v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cdclk@mode-rejected-max-dotclock:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_cdclk@mode-rejected-max-dotclock.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          NOTRUN -> [FAIL][2] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-lnl:          NOTRUN -> [SKIP][3] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [PASS][4] -> [DMESG-WARN][5] +240 other tests dmesg-warn
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +47 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@process-many-stride-new-busy:
    - shard-bmg:          [SKIP][9] ([Intel XE#8589]) -> [DMESG-WARN][10] +9 other tests dmesg-warn
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-new-busy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-new-busy.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [SKIP][11] ([Intel XE#8589]) -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_pm@s4-vm-bind-userptr.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - {shard-ptl}:        NOTRUN -> [SKIP][13] +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@runner@aborted:
    - {shard-ptl}:        NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-174512v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#610] / [Intel XE#7387])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7679])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#367]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2724] / [Intel XE#7449])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252]) +5 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6507])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2390] / [Intel XE#6974])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6974])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7642])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2320]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1424])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#9009])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8265]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][37] ([Intel XE#2049] / [Intel XE#2597] / [Intel XE#8155]) +1 other test incomplete
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][38] -> [FAIL][39] ([Intel XE#301]) +2 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7349])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7351])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7905]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7061]) +4 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4141]) +14 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#656] / [Intel XE#7905]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2311]) +46 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6312])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7865]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +46 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6911] / [Intel XE#7378])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_mst@mst-suspend-read-crc:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8348])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8303]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#7283]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2393])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#5021] / [Intel XE#7377])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#5020] / [Intel XE#7348])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8396]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc3co-vpb-framegap:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#8395] / [Intel XE#8396]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-framegap.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#8399])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7794])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#2893] / [Intel XE#7304])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#1489]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2330] / [Intel XE#5813])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2413])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#6503]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8370])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_evict@evict-threads-small-multi-queue.html
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#6540] / [Intel XE#688])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@twice-parallel-basic:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#7482])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-5/igt@xe_exec_balancer@twice-parallel-basic.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8374]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#8374])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#8364]) +23 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#8364]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-basic.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8369])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#7850])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-4/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#8378]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-bmg:          [PASS][88] -> [ABORT][89] ([Intel XE#8007])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6964]) +4 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#7793])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#584] / [Intel XE#7369])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2284] / [Intel XE#7370])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#7992])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#944])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          NOTRUN -> [FAIL][99] ([Intel XE#7992]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][100] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:
    - shard-bmg:          [FAIL][102] ([Intel XE#6078]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][104] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@d-edp1:
    - {shard-ptl}:        [FAIL][106] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][107] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [DMESG-FAIL][108] -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [INCOMPLETE][110] ([Intel XE#9272]) -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@kms_vblank@ts-continuation-suspend.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][112] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - {shard-ptl}:        [FAIL][114] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][115] +4 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@max-min:
    - {shard-ptl}:        [FAIL][116] ([Intel XE#4227]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@kms_vrr@max-min.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@kms_vrr@max-min.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          [ABORT][118] ([Intel XE#8007]) -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [SKIP][120] ([Intel XE#8589]) -> [PASS][121] +62 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][122] ([Intel XE#9096]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-6/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [SKIP][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_module_load@load.html
    - {shard-ptl}:        ([PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [SKIP][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200]) ([Intel XE#9286]) -> ([PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-5/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-5/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-5/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-6/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-2/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-2/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-2/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-7/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-7/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-7/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-4/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-4/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-6/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-6/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][225] ([Intel XE#8589]) -> [SKIP][226] ([Intel XE#2327])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [SKIP][227] ([Intel XE#8589]) -> [SKIP][228] ([Intel XE#1124])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][229] ([Intel XE#8589]) -> [SKIP][230] ([Intel XE#2887]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][231] ([Intel XE#8589]) -> [SKIP][232] ([Intel XE#8265])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][233] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][234] ([Intel XE#301])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][235] ([Intel XE#8589]) -> [SKIP][236] ([Intel XE#2311]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][237] ([Intel XE#8589]) -> [SKIP][238] ([Intel XE#4141]) +1 other test skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#8589]) -> [SKIP][240] ([Intel XE#2313]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][241] ([Intel XE#8589]) -> [SKIP][242] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][243] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][244] ([Intel XE#3544])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][245] ([Intel XE#8589]) -> [SKIP][246] ([Intel XE#6911] / [Intel XE#7466])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][247] ([Intel XE#8589]) -> [SKIP][248] ([Intel XE#7283])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][249] ([Intel XE#8710]) -> [SKIP][250] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][251] ([Intel XE#8589]) -> [SKIP][252] ([Intel XE#1489]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][253] ([Intel XE#8589]) -> [SKIP][254] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          [SKIP][255] ([Intel XE#8589]) -> [ABORT][256] ([Intel XE#8868])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@sriov_basic@pf-unbind-with-vf-probed.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-bmg:          [SKIP][257] ([Intel XE#8589]) -> [SKIP][258] ([Intel XE#2322] / [Intel XE#7372])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_basic@multigpu-once-rebind.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:
    - shard-bmg:          [SKIP][259] ([Intel XE#8589]) -> [SKIP][260] ([Intel XE#8374]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][261] ([Intel XE#8589]) -> [SKIP][262] ([Intel XE#8364]) +3 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][263] ([Intel XE#8589]) -> [SKIP][264] ([Intel XE#8369])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-bmg:          [SKIP][265] ([Intel XE#8589]) -> [SKIP][266] ([Intel XE#8378])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_page_reclaim@many-vma-same-bo:
    - shard-bmg:          [SKIP][267] ([Intel XE#8589]) -> [SKIP][268] ([Intel XE#7793])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_page_reclaim@many-vma-same-bo.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_page_reclaim@many-vma-same-bo.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          [INCOMPLETE][269] ([Intel XE#9263]) -> [FAIL][270] ([Intel XE#7695])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_pat@pat-sw-hw-suspend.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [SKIP][271] ([Intel XE#8589]) -> [DMESG-WARN][272] ([Intel XE#8963])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5878
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8348
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9009
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9263
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9272]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9272
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9100 -> IGT_9101
  * Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -> xe-pw-174512v1

  IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc05a1c11a785e709c05
  xe-pw-174512v1: 174512v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/index.html

--===============3889520330001429118==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: nuke PTs only after unlinking con=
tested VMAs</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174512/">https://patchwork.freedesktop.org/series/174512/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-174512v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174512v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5778-15f7465765dc45d58738fc05a1c11a785=
e709c05_FULL -&gt; xe-pw-174512v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-174512v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-174512v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1745=
12v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-rejected-max-dotclock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_cdclk@mode-rejected-max-d=
otclock.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank160.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank80.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@xe_exec_=
system_allocator@many-execqueues-mmap-huge-nomemset.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg=
-9/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html">DM=
ESG-WARN</a> +240 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-malloc-madvise.html">DMESG-WARN</a> +47=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_pm@s2idle-vm-bind-=
unbind-all.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-busy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-stride-new-busy.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/s=
hard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-new-busy.html">=
DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_pm@s4=
-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_pm@s4-vm-bi=
nd-userptr.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>{shard-ptl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank80.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>{shard-ptl}:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@runner@aborted.html">FAIL</a>=
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174512v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-target-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8=
150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_cdclk@mode-transition-all=
-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_chamelium_audio@dp-audio=
-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_chamelium_color_pipeline=
@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_content_protection@dp-mst=
-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@uhbr-to-hbr-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@uhb=
r-to-hbr-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9009">Intel XE#9009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-bi=
gjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.h=
tml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32b=
pp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel X=
E#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
s-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
hdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
hdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +14 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +46 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-=
rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +46 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_mst@mst-suspend-read-crc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@kms_mst@mst-suspend-read-crc.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8348">Intel XE#8348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_plane_lowres@tiling-y.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-=
yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_plane_scaling@planes-ups=
cale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#68=
86</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-framegap.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8396">Intel XE#8396</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-2/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-174512v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">I=
ntel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_psr2_sf@psr2-cursor-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-fo=
rmat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_sharpness_filter@invalid-=
filter-with-nearest-neighbor.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_create@multigpu-create-mas=
sive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2504">Intel XE#2504</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_evict@evict-threads-small-=
multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8370">Intel XE#8370</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@xe_evict@evict-threads-small-=
multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-5/igt@xe_exec_balancer@twice-parall=
el-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-n=
ull-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +6 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-1/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +23 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-=
close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-4/igt@xe_exec_=
reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2/i=
gt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel =
XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-=
bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-migratio=
n-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_page_reclaim@prl-max-entri=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-lnl-3/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/584">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_pm@s4-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-4/igt@xe_pmu@f=
n-engine-activity-load.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_pmu@fn-engine-activ=
ity-load.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7992">Intel XE#7992</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-up=
date-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_sriov_auto_provisioning@r=
esources-released-on-vfs-disabling@numvfs-random.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a=
>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1=
/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-b-dp-2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/s=
hard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-dp-2.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-edp1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@kms_flip=
@flip-vs-expired-vblank@d-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sh=
ard-ptl-1/igt@kms_flip@flip-vs-expired-vblank@d-edp1.html">PASS</a> +1 othe=
r test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-bottom.html">DMESG-FAIL</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-=
10/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a><=
/li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@kms_vbla=
nk@ts-continuation-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/9272">Intel XE#9272</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/ig=
t@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@=
flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/s=
hard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +4 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>{shard-ptl}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-6/igt@kms_vrr@=
max-min.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4227">Intel XE#4227</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@kms_vrr@max-min.html">P=
ASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_conf=
igfs@ctx-restore-mid-bb-invalid.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/ig=
t@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-shared-remap-dontunmap-eoch=
eck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
system_allocator@many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">I=
ntel XE#8589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-174512v1/shard-bmg-9/igt@xe_exec_system_allocator@many-large-mmap-s=
hared-remap-dontunmap-eocheck.html">PASS</a> +62 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-6/igt@xe_exec_=
threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sh=
ard-lnl-2/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e7=
09c05/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a7=
85e709c05/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c=
11a785e709c05/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738f=
c05a1c11a785e709c05/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58=
738fc05a1c11a785e709c05/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc4=
5d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f746576=
5dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f74=
65765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-1=
5f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-10/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-=
8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e7=
09c05/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174512v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shar=
d-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174512v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174512v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-174512v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-174512v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-174512v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-174512v1/shard-bmg-9/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@xe_module_loa=
d@load.html">PASS</a>)</li>
<li>{shard-ptl}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-p=
tl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sha=
rd-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05=
/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e70=
9c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a78=
5e709c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c1=
1a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05=
a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738=
fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d5=
8738fc05a1c11a785e709c05/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc=
45d58738fc05a1c11a785e709c05/shard-ptl-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f74657=
65dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-15f7=
465765dc45d58738fc05a1c11a785e709c05/shard-ptl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5778-=
15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-ptl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-=
ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/sh=
ard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c0=
5/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/9286">Intel XE#9286</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174512v1/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174512v1/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-7/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174512v1/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-174512v1/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-p=
tl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-ptl-8/igt@xe_mod=
ule_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_=
fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms_b=
ig_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
12v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-5=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_dsc@=
dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@kms_dsc@dsc-with-=
bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-lnl-2=
/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8=
589</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
74512v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb=
-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
12v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#858=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174=
512v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sh=
ard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-3/igt@kms=
_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_plan=
e@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/ig=
t@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8710">Intel XE#8710</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/ig=
t@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3=
141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
83">Intel XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr2=
_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sha=
rd-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">=
Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@kms_psr@=
pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-7/igt@kms_psr@p=
r-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@sriov_ba=
sic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-4/igt@sr=
iov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_e=
xec_basic@multigpu-once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
fault_mode@once-multi-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sha=
rd-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-rebind-prefetch.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374"=
>Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1745=
12v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-user=
ptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-=
bmg-5/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel =
XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_exec_=
threads@threads-multi-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/sha=
rd-bmg-8/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">=
Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@many-vma-same-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_page_=
reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-10/igt@xe_pa=
ge_reclaim@many-vma-same-bo.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-6/igt@xe_pat@p=
at-sw-hw-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/9263">Intel XE#9263</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-8/igt@xe_pat@p=
at-sw-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05/shard-bmg-5/igt@xe_wedge=
d@wedged-at-any-timeout.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174512v1/shard-bmg-1/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9100 -&gt; IGT_9101</li>
<li>Linux: xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05 -&gt; xe-pw-174=
512v1</li>
</ul>
<p>IGT_9100: 80e998fdbe300b1ca29901099f35316bd83781e4 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9101: 16e3ae670fa6c3ee97f113c688a172bb0f6034e7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5778-15f7465765dc45d58738fc05a1c11a785e709c05: 15f7465765dc45d58738fc0=
5a1c11a785e709c05<br />
  xe-pw-174512v1: 174512v1</p>

</body>
</html>

--===============3889520330001429118==--
