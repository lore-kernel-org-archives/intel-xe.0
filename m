Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8FAC982EE
	for <intel-xe@archiver.kernel.org>; Mon, 21 Sep 2026 20:02:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7117410E3FE;
	Mon, 21 Sep 2026 20:02:10 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A1A10E3FE;
 Mon, 21 Sep 2026 20:02:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3478208584171434498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/sysctrl=3A_Clean_up?=
 =?utf-8?q?_error_handling_in_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 21 Sep 2026 20:02:09 -0000
Message-ID: <179002092915.188434.6474347630228722469@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
In-Reply-To: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
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

--===============3478208584171434498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Clean up error handling in (rev6)
URL   : https://patchwork.freedesktop.org/series/172513/
State : failure

== Summary ==

CI Bug Log - changes from xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb_FULL -> xe-pw-172513v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172513v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172513v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172513v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@i2c:
    - shard-ptl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-6/igt@kms_pm_rpm@i2c.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-7/igt@kms_pm_rpm@i2c.html

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap:
    - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +51 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@twice-large-malloc-nomemset:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][5] +19 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][6] -> [INCOMPLETE][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-172513v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose-with-load:
    - shard-bmg:          [PASS][8] -> [ABORT][9] ([Intel XE#8007]) +1 other test abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose-with-load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-9/igt@core_hotunplug@hotrebind-lateclose-with-load.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2233])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5947])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5901]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2327]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#1231] / [Intel XE#8628])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5808]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5855])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7679])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5822]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2724] / [Intel XE#7449])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2325] / [Intel XE#7358])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2252])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#2252]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6969]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4.html

  * igt@kms_content_protection@suspend-resume:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7642])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5900]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#5846])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#5962]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5962] / [Intel XE#7343])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4210] / [Intel XE#7467])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#4331] / [Intel XE#7227])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8265])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5907])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2372] / [Intel XE#7359])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@blocking-wf_vblank@c-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][40] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5828]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#7178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#7061] / [Intel XE#7356])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4141]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5812]) +29 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +17 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7061]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#6312]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7061])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#7865]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7399])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +19 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank160:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#9313])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4298] / [Intel XE#5873])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#7283]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7283]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#8076])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#4596] / [Intel XE#5854]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1489]) +4 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#5858] / [Intel XE#7304]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#5858])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#7413])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#1406])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#5813])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#5910])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#6503])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2450] / [Intel XE#5857])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr-video-mode:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#9271])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_vrr@cmrr-video-mode.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][77] -> [FAIL][78] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#5949] / [Intel XE#9277])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_vrr@negative-basic.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#5764])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#8370])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#6144])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#7482]) +9 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#8578])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#8374]) +8 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#8374]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#8364]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][91] ([Intel XE#8364]) +13 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html

  * igt@xe_exec_reset@gt-stress-reset-rapid-cycle:
    - shard-lnl:          [PASS][92] -> [INCOMPLETE][93] ([Intel XE#8652] / [Intel XE#9317])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-1/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html

  * igt@xe_exec_reset@multi-queue-cancel:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#8369])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_reset@multi-queue-cancel.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-bmg:          [PASS][95] -> [FAIL][96] ([Intel XE#9096])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#8378]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#8378]) +5 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#5775])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#6964])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][101] ([Intel XE#6069])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_page_reclaim@prl-invalidate-full:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#7793])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_page_reclaim@prl-invalidate-full.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#7590]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#7590])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][105] -> [INCOMPLETE][106] ([Intel XE#8175])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-5/igt@xe_pm@s3-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@xe_pm@s3-basic.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#944])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#6376] / [Intel XE#7422])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-bmg:          [INCOMPLETE][109] -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][111] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][113] ([Intel XE#6078]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-ptl:          [FAIL][115] -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-6/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][117] ([Intel XE#301]) -> [PASS][118] +1 other test pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][119] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-ptl:          [SKIP][121] ([Intel XE#352]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-7/igt@kms_force_connector_basic@prune-stale-modes.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@xe_configfs@ctx-restore-mid-bb:
    - shard-bmg:          [ABORT][123] ([Intel XE#8007]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_configfs@ctx-restore-mid-bb.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-bmg:          [DMESG-WARN][125] -> [PASS][126] +58 other tests pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [FAIL][127] ([Intel XE#9096]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [INCOMPLETE][129] -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-7/igt@xe_pm@s4-mocs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_waitfence@reltime:
    - shard-ptl:          [FAIL][131] ([Intel XE#9115]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-8/igt@xe_waitfence@reltime.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-6/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][133] ([Intel XE#3544]) -> [SKIP][134] ([Intel XE#3374] / [Intel XE#3544])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#5855]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9317
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb -> xe-pw-172513v6

  IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb
  xe-pw-172513v6: 172513v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/index.html

--===============3478208584171434498==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Clean up error handling in (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172513/">https://patchwork.freedesktop.org/series/172513/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb_FULL -&gt; xe-pw-172513v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172513v6_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172513v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172513v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-6/igt@kms_pm_rpm@i2c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-7/igt@kms_pm_rpm@i2c.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap.html">DMESG-WARN</a> +51 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-malloc-nomemset.html">DMESG-WARN</a> +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172513v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-2/igt@core_hotunplug@hotrebind-lateclose-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-9/igt@core_hotunplug@hotrebind-lateclose-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-7/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5855">Intel XE#5855</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-10/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank160:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_hdmi_audio_bw@audio-bw-hblank160.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313">Intel XE#9313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-video-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@kms_vrr@cmrr-video-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5949">Intel XE#5949</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9277">Intel XE#9277</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_exec_balancer@twice-cm-parallel-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-rapid-cycle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-1/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-5/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9317">Intel XE#9317</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cancel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_reset@multi-queue-cancel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-8/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6069">Intel XE#6069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-invalidate-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_page_reclaim@prl-invalidate-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-5/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-8/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-6/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-8/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-7/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-5/igt@kms_force_connector_basic@prune-stale-modes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-1/igt@xe_configfs@ctx-restore-mid-bb.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-3/igt@xe_configfs@ctx-restore-mid-bb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">PASS</a> +58 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-lnl-7/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-7/igt@xe_pm@s4-mocs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-4/igt@xe_pm@s4-mocs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-ptl-8/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-ptl-6/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_hdr@brightness-with-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172513v6/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb -&gt; xe-pw-172513v6</li>
</ul>
<p>IGT_9103: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5795-f709158f7998ec6a0c6ecebe5aa7911bfb8412bb: f709158f7998ec6a0c6ecebe5aa7911bfb8412bb<br />
  xe-pw-172513v6: 172513v6</p>

</body>
</html>

--===============3478208584171434498==--
