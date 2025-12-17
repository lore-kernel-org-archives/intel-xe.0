Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B5FD65C54
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 14:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A5410ECEC;
	Wed, 17 Dec 2025 14:25:40 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD1F10ECEC;
 Wed, 17 Dec 2025 14:25:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5262214547997196307=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Survivability_mode_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Dec 2025 14:25:39 -0000
Message-ID: <176598153943.97631.13400073500326954583@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216101159.332558-4-riana.tauro@intel.com>
In-Reply-To: <20251216101159.332558-4-riana.tauro@intel.com>
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

--===============5262214547997196307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Survivability mode fixes
URL   : https://patchwork.freedesktop.org/series/159096/
State : failure

== Summary ==

CI Bug Log - changes from xe-4253-2dc4a4ece453df925f995df5eac747a29081c180_FULL -> xe-pw-159096v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159096v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159096v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159096v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [PASS][1] -> ([PASS][2], [SKIP][3]) +1 other test ( 1 pass, 1 skip )
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> ([PASS][4], [INCOMPLETE][5]) +1 other test ( 1 incomplete, 1 pass )
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][7] -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [PASS][10] -> ([FAIL][11], [PASS][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_module_load@reload-no-display.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_module_load@reload-no-display.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_module_load@reload-no-display.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][13] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in xe-pw-159096v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [PASS][15] -> ([SKIP][16], [PASS][17]) ([Intel XE#6779])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@core_hotunplug@hotrebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_hotunplug@hotrebind.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@core_hotunplug@hotrebind.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#6779]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@info:
    - shard-bmg:          [PASS][19] -> ([SKIP][20], [PASS][21]) ([Intel XE#2134])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@fbdev@info.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@info.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@fbdev@info.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2134])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@unaligned-read.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2134]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@fbdev@unaligned-write.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#6703]) +551 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_addfb_basic@unused-pitches:
    - shard-bmg:          [PASS][26] -> ([PASS][27], [SKIP][28]) ([Intel XE#6557] / [Intel XE#6703]) +2 other tests ( 1 pass, 1 skip )
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_addfb_basic@unused-pitches.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_addfb_basic@unused-pitches.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][29] -> ([FAIL][30], [SKIP][31]) ([Intel XE#3718] / [Intel XE#6078] / [Intel XE#6703])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#3718] / [Intel XE#6078])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> ([SKIP][34], [SKIP][35]) ([Intel XE#2327])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2327])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#1124]) +2 other tests ( 2 skip )
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> ([SKIP][39], [SKIP][40]) ([Intel XE#610])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> ([SKIP][42], [SKIP][43]) ([Intel XE#2314] / [Intel XE#2894])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> ([SKIP][44], [SKIP][45]) ([Intel XE#367])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#367]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> ([SKIP][47], [SKIP][48]) ([Intel XE#2887]) +3 other tests ( 2 skip )
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#3432])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2325])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          NOTRUN -> ([SKIP][53], [SKIP][54]) ([Intel XE#2252]) +2 other tests ( 2 skip )
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2390])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> ([SKIP][56], [SKIP][57]) ([Intel XE#2320]) +1 other test ( 2 skip )
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2320])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#4210])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2374])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [PASS][61] -> ([SKIP][62], [FAIL][63]) ([Intel XE#3321] / [Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#3321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2311]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#2311]) +7 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4141])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> ([SKIP][73], [SKIP][74]) ([Intel XE#4141]) +5 other tests ( 2 skip )
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#2313]) +6 other tests ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2313]) +7 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][78] ([Intel XE#6740]) +1 other test abort
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][79], [SKIP][80]) ([Intel XE#2486])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> ([SKIP][81], [SKIP][82]) ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [PASS][83] -> ([PASS][84], [SKIP][85]) ([Intel XE#6693])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_pm_rpm@dpms-non-lpsp.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#6693])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> ([SKIP][88], [SKIP][89]) ([Intel XE#1406] / [Intel XE#1489]) +2 other tests ( 2 skip )
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> ([SKIP][91], [SKIP][92]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests ( 2 skip )
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr@psr-sprite-render.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_psr@psr-sprite-render.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#1406] / [Intel XE#6703]) +13 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> ([SKIP][94], [SKIP][95]) ([Intel XE#3414] / [Intel XE#3904])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> ([SKIP][96], [SKIP][97]) ([Intel XE#2426])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> ([SKIP][98], [SKIP][99]) ([Intel XE#2504])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#4837])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-vm-destroy.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          NOTRUN -> ([SKIP][101], [SKIP][102]) ([Intel XE#4837]) +2 other tests ( 2 skip )
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> ([SKIP][103], [SKIP][104]) ([Intel XE#6665])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_eudebug_online@pagefault-one-of-many.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4837] / [Intel XE#6665])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          [PASS][106] -> ([PASS][107], [SKIP][108]) ([Intel XE#6703]) +433 other tests ( 1 pass, 1 skip )
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-null-defer-bind.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][109], [SKIP][110]) ([Intel XE#2322])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2322])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> ([SKIP][112], [SKIP][113]) ([Intel XE#6874]) +7 other tests ( 2 skip )
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#6874]) +5 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][115] -> [WARN][116] ([Intel XE#5786])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#6703]) +329 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#4943]) +7 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> ([SKIP][120], [SKIP][121]) ([Intel XE#4943]) +1 other test ( 2 skip )
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> ([SKIP][122], [SKIP][123]) ([Intel XE#6281])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][124] -> [SKIP][125] ([Intel XE#2229]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_live_ktest@xe_bo.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> ([SKIP][126], [SKIP][127]) ([Intel XE#2236])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][128] -> [FAIL][129] ([Intel XE#6251])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][130] -> ([FAIL][131], [FAIL][132]) ([Intel XE#6251]) +2 other tests ( 2 fail )
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> ([SKIP][133], [SKIP][134]) ([Intel XE#4733])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][135] ([Intel XE#6054]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][137] ([Intel XE#301]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][139] ([Intel XE#2049] / [Intel XE#2597]) -> ([PASS][140], [PASS][141]) +1 other test ( 2 pass )
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_setmode@basic@pipe-a-edp-1:
    - shard-lnl:          [FAIL][142] ([Intel XE#6361]) -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-5/igt@kms_setmode@basic@pipe-a-edp-1.html

  * igt@kms_setmode@basic@pipe-b-hdmi-a-3:
    - shard-bmg:          [FAIL][144] ([Intel XE#6361]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_setmode@basic@pipe-b-hdmi-a-3.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter:
    - shard-lnl:          [DMESG-WARN][146] ([Intel XE#4537]) -> ([PASS][147], [PASS][148]) +1 other test ( 2 pass )
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][149] ([Intel XE#5625]) -> ([PASS][150], [PASS][151])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][152] ([Intel XE#6251]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [FAIL][154] ([Intel XE#6054] / [Intel XE#6676]) -> [FAIL][155] ([Intel XE#6676])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][156] ([Intel XE#2327]) -> ([SKIP][157], [SKIP][158]) ([Intel XE#2327] / [Intel XE#6703]) +2 other tests ( 2 skip )
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][159] ([Intel XE#2327]) -> [SKIP][160] ([Intel XE#6703]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][161] ([Intel XE#1124]) -> ([SKIP][162], [SKIP][163]) ([Intel XE#1124] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [SKIP][164] ([Intel XE#1124]) -> [SKIP][165] ([Intel XE#6703]) +5 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][166] ([Intel XE#2314] / [Intel XE#2894]) -> ([SKIP][167], [SKIP][168]) ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#6703]) +1 other test ( 2 skip )
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][169] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][170] ([Intel XE#6703])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][171] ([Intel XE#367]) -> [SKIP][172] ([Intel XE#6703]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][173] ([Intel XE#2887]) -> ([SKIP][174], [SKIP][175]) ([Intel XE#2887] / [Intel XE#6557] / [Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][176] ([Intel XE#2887]) -> [SKIP][177] ([Intel XE#6703]) +8 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][178] ([Intel XE#2652] / [Intel XE#787]) -> ([SKIP][179], [SKIP][180]) ([Intel XE#2652] / [Intel XE#6703] / [Intel XE#787])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][181] ([Intel XE#3432]) -> ([SKIP][182], [SKIP][183]) ([Intel XE#3432] / [Intel XE#6703])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][184] ([Intel XE#3432]) -> [SKIP][185] ([Intel XE#6703])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][186] ([Intel XE#2887]) -> ([SKIP][187], [SKIP][188]) ([Intel XE#2887] / [Intel XE#6703]) +10 other tests ( 2 skip )
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][189] ([Intel XE#2325]) -> [SKIP][190] ([Intel XE#6703]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][191] ([Intel XE#2325]) -> ([SKIP][192], [SKIP][193]) ([Intel XE#2325] / [Intel XE#6703])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          [SKIP][194] ([Intel XE#2252]) -> ([SKIP][195], [SKIP][196]) ([Intel XE#2252] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][197] ([Intel XE#2252]) -> [SKIP][198] ([Intel XE#6703]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][199] ([Intel XE#2390]) -> ([SKIP][200], [SKIP][201]) ([Intel XE#2390] / [Intel XE#6703])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][202] ([Intel XE#1178]) -> ([SKIP][203], [FAIL][204]) ([Intel XE#1178] / [Intel XE#6703])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_content_protection@srm.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_content_protection@srm.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][205] ([Intel XE#2320]) -> [SKIP][206] ([Intel XE#6703]) +3 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][207] ([Intel XE#2321]) -> ([SKIP][208], [SKIP][209]) ([Intel XE#2321] / [Intel XE#6703]) +1 other test ( 2 skip )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          [SKIP][210] ([Intel XE#2320]) -> ([SKIP][211], [SKIP][212]) ([Intel XE#2320] / [Intel XE#6703]) +3 other tests ( 2 skip )
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-64x21.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][213] ([Intel XE#2286]) -> [SKIP][214] ([Intel XE#6703])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][215] ([Intel XE#4354]) -> ([SKIP][216], [SKIP][217]) ([Intel XE#4354] / [Intel XE#6703])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][218] ([Intel XE#4331]) -> ([SKIP][219], [SKIP][220]) ([Intel XE#4331] / [Intel XE#6703])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][221] ([Intel XE#2244]) -> [SKIP][222] ([Intel XE#6703]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][223] ([Intel XE#2244]) -> ([SKIP][224], [SKIP][225]) ([Intel XE#2244] / [Intel XE#6703])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][226] ([Intel XE#4422]) -> ([SKIP][227], [SKIP][228]) ([Intel XE#4422] / [Intel XE#6703])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][229] ([Intel XE#2375]) -> ([SKIP][230], [SKIP][231]) ([Intel XE#2375] / [Intel XE#6703])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_feature_discovery@dp-mst.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][232] ([Intel XE#2374]) -> [SKIP][233] ([Intel XE#6703])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][234] ([Intel XE#2293] / [Intel XE#2380]) -> ([SKIP][235], [SKIP][236]) ([Intel XE#2293] / [Intel XE#2380] / [Intel XE#6703]) +3 other tests ( 2 skip )
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][237] ([Intel XE#2380]) -> [SKIP][238] ([Intel XE#6703])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][239] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][240] ([Intel XE#6703]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][241] ([Intel XE#2311]) -> ([SKIP][242], [SKIP][243]) ([Intel XE#2311] / [Intel XE#6703]) +21 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][244] ([Intel XE#4141]) -> ([SKIP][245], [SKIP][246]) ([Intel XE#4141] / [Intel XE#6703]) +11 other tests ( 2 skip )
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][247] ([Intel XE#4141]) -> [SKIP][248] ([Intel XE#6703]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][249] ([Intel XE#2311]) -> [SKIP][250] ([Intel XE#6703]) +14 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][251] ([Intel XE#2313]) -> ([SKIP][252], [SKIP][253]) ([Intel XE#2313] / [Intel XE#6703]) +21 other tests ( 2 skip )
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2313]) -> [SKIP][255] ([Intel XE#6703]) +17 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][256] ([Intel XE#2350]) -> [SKIP][257] ([Intel XE#6703])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][258] ([Intel XE#2313]) -> [SKIP][259] ([Intel XE#6557] / [Intel XE#6703])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms:
    - shard-bmg:          [ABORT][260] ([Intel XE#6740]) -> [SKIP][261] ([Intel XE#6703])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_hdr@bpc-switch-dpms.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][262] ([Intel XE#2934] / [Intel XE#6590]) -> ([SKIP][263], [SKIP][264]) ([Intel XE#2934] / [Intel XE#6590] / [Intel XE#6703])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          [SKIP][265] ([Intel XE#6590]) -> [SKIP][266] ([Intel XE#6703])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_joiner@basic-max-non-joiner.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][267] ([Intel XE#346] / [Intel XE#6590]) -> [SKIP][268] ([Intel XE#6703])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][269] ([Intel XE#5624]) -> ([SKIP][270], [SKIP][271]) ([Intel XE#5624] / [Intel XE#6703])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][272] ([Intel XE#5021]) -> ([SKIP][273], [SKIP][274]) ([Intel XE#5021] / [Intel XE#6703])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][275] ([Intel XE#2685] / [Intel XE#3307]) -> ([SKIP][276], [SKIP][277]) ([Intel XE#2685] / [Intel XE#3307] / [Intel XE#6703])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][278] ([Intel XE#6886]) -> ([SKIP][279], [SKIP][280]) ([Intel XE#6703] / [Intel XE#6886])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][281] ([Intel XE#6886]) -> [SKIP][282] ([Intel XE#6703])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][283] ([Intel XE#870]) -> [SKIP][284] ([Intel XE#6703])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][285] ([Intel XE#870]) -> ([SKIP][286], [SKIP][287]) ([Intel XE#6703] / [Intel XE#870])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_pm_backlight@fade-with-suspend.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          [SKIP][288] ([Intel XE#1406] / [Intel XE#1489]) -> ([SKIP][289], [SKIP][290]) ([Intel XE#1406] / [Intel XE#1489] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][291] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][292] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][293] ([Intel XE#1406] / [Intel XE#2387]) -> ([SKIP][294], [SKIP][295]) ([Intel XE#1406] / [Intel XE#2387] / [Intel XE#6703])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          [SKIP][296] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> ([SKIP][297], [SKIP][298]) ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) +6 other tests ( 2 skip )
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr@pr-primary-render.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr@pr-primary-render.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr@pr-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][299] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][300] ([Intel XE#1406] / [Intel XE#6703]) +7 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_psr@psr2-sprite-blt.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][301] ([Intel XE#1406] / [Intel XE#2414]) -> ([SKIP][302], [SKIP][303]) ([Intel XE#1406] / [Intel XE#2414] / [Intel XE#6703])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][304] ([Intel XE#2330]) -> ([SKIP][305], [SKIP][306]) ([Intel XE#2330] / [Intel XE#6703])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][307] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][308] ([Intel XE#6703])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][309] ([Intel XE#3414] / [Intel XE#3904]) -> ([SKIP][310], [SKIP][311]) ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#6703])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          [SKIP][312] ([Intel XE#2413]) -> ([SKIP][313], [SKIP][314]) ([Intel XE#2413] / [Intel XE#6703])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][315] ([Intel XE#6361]) -> ([PASS][316], [SKIP][317]) ([Intel XE#6703])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_setmode@basic.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_setmode@basic.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_setmode@basic.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          [SKIP][318] ([Intel XE#6503]) -> [SKIP][319] ([Intel XE#6703]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_sharpness_filter@filter-modifiers.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][320] ([Intel XE#1499]) -> [SKIP][321] ([Intel XE#6703])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_vrr@flip-basic.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          [SKIP][322] ([Intel XE#1499]) -> ([SKIP][323], [SKIP][324]) ([Intel XE#1499] / [Intel XE#6703])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_vrr@flip-basic-fastset.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][325] ([Intel XE#4837]) -> [SKIP][326] ([Intel XE#6703]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-bmg:          [SKIP][327] ([Intel XE#4837]) -> ([SKIP][328], [SKIP][329]) ([Intel XE#4837] / [Intel XE#6557] / [Intel XE#6703])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][330] ([Intel XE#4837]) -> ([SKIP][331], [SKIP][332]) ([Intel XE#4837] / [Intel XE#6703]) +4 other tests ( 2 skip )
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug@vm-bind-clear.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][333] ([Intel XE#4837] / [Intel XE#6665]) -> ([SKIP][334], [SKIP][335]) ([Intel XE#4837] / [Intel XE#6665] / [Intel XE#6703]) +3 other tests ( 2 skip )
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_eudebug_online@basic-breakpoint.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_eudebug_online@basic-breakpoint.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          [SKIP][336] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][337] ([Intel XE#6703]) +4 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint-faultable.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][338] ([Intel XE#2322]) -> [SKIP][339] ([Intel XE#6703]) +5 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][340] ([Intel XE#2322]) -> ([SKIP][341], [SKIP][342]) ([Intel XE#2322] / [Intel XE#6703]) +7 other tests ( 2 skip )
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][343] ([Intel XE#6874]) -> ([SKIP][344], [SKIP][345]) ([Intel XE#6703] / [Intel XE#6874]) +21 other tests ( 2 skip )
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][346] ([Intel XE#6874]) -> [SKIP][347] ([Intel XE#6703]) +18 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          [SKIP][348] ([Intel XE#5007]) -> ([SKIP][349], [SKIP][350]) ([Intel XE#5007] / [Intel XE#6703]) +1 other test ( 2 skip )
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          [SKIP][351] ([Intel XE#4943]) -> [SKIP][352] ([Intel XE#6703]) +10 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][353] ([Intel XE#4943]) -> ([SKIP][354], [SKIP][355]) ([Intel XE#4943] / [Intel XE#6703]) +14 other tests ( 2 skip )
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][356] ([Intel XE#586]) -> [SKIP][357] ([Intel XE#6703])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_mmap@small-bar.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_mmap@small-bar.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][358] ([Intel XE#2245]) -> ([SKIP][359], [SKIP][360]) ([Intel XE#2245] / [Intel XE#6703])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][361] ([Intel XE#2284]) -> ([SKIP][362], [SKIP][363]) ([Intel XE#2284] / [Intel XE#6703]) +1 other test ( 2 skip )
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][364] ([Intel XE#2284]) -> [SKIP][365] ([Intel XE#6703])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_pm@s4-d3cold-basic-exec.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [FAIL][366] ([Intel XE#6251]) -> ([PASS][367], [FAIL][368]) ([Intel XE#6251])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][369] ([Intel XE#4733]) -> ([SKIP][370], [SKIP][371]) ([Intel XE#4733] / [Intel XE#6703])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-bmg:          [SKIP][372] ([Intel XE#4733]) -> [SKIP][373] ([Intel XE#6703]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][374] ([Intel XE#944]) -> ([SKIP][375], [SKIP][376]) ([Intel XE#6703] / [Intel XE#944]) +2 other tests ( 2 skip )
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6676]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4253-2dc4a4ece453df925f995df5eac747a29081c180 -> xe-pw-159096v1

  IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4253-2dc4a4ece453df925f995df5eac747a29081c180: 2dc4a4ece453df925f995df5eac747a29081c180
  xe-pw-159096v1: 159096v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/index.html

--===============5262214547997196307==
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
<tr><td><b>Series:</b></td><td>Survivability mode fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/159096/">https://patchwork.freedesktop.org/series/159096/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159096v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159096v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4253-2dc4a4ece453df925f995df5eac747a29=
081c180_FULL -&gt; xe-pw-159096v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159096v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-159096v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1590=
96v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@core_set=
master@master-drop-set-shared-fd.html">PASS</a> -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@core_setmas=
ter@master-drop-set-shared-fd.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_setmaster@maste=
r-drop-set-shared-fd.html">SKIP</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_atomic_transition@plane-=
all-transition@pipe-b-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_atomic_transition@p=
lane-all-transition@pipe-b-dp-2.html">INCOMPLETE</a>) +1 other test ( 1 inc=
omplete, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm=
@modeset-non-lpsp-stress-no-wait.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_module_load@many-reload.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_module_load@relo=
ad-no-display.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_module_load@reload-no-display.htm=
l">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@modeset-lpsp-stress:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp-stress.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096=
v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159096v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@core_hot=
unplug@hotrebind.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_hotunplug@hotrebind.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-1/igt@core_hotunplug@hotrebind.html">PASS</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a=
>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@core_hotunplug@hotunplug-resc=
an.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6779">Intel XE#6779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@fbdev@in=
fo.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@info.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@fbdev=
@info.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@unaligned-read.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134=
">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@fbdev@un=
aligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@fbdev@unaligned-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_addfb_basic@unused-handle=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703">Intel XE#6703</a>) +551 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_addf=
b_basic@unused-pitches.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_addfb_basic@unuse=
d-pitches.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_addfb_basic@unused-pitches.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557=
">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +2 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms=
_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel=
 XE#6078</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bm=
g-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
18">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-siz=
e-overflow.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_bw@connected-linear-t=
iling-3-displays-3840x2160p.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displ=
ays-1920x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-192=
0x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation=
-180-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_chamelium_color@ctm-red-t=
o-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamelium_frames@dp-crc-f=
ast.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_chamelium_frames@hdmi-cr=
c-nonplanar-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-=
nonplanar-formats.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscr=
een-256x85.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-256x85.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2320">Intel XE#2320</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding=
-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_feature_discovery@psr2.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip@2x-flip-=
vs-expired-vblank.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vbla=
nk.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3321">Intel XE#3321</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms=
_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-wf_=
vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drr=
s-rgb565-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests ( 2 skip )=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pip=
e-fbc-rte.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4141">Intel XE#4141</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-move.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_frontbuffer_tracki=
ng@psr-1p-primscrn-cur-indfb-move.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hd=
mi-a-3.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_panel_fitting@atomic-fas=
tset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159096v1/shard-bmg-8/igt@kms_panel_fitting@atomic-fastset.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">I=
ntel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v=
1/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#31=
41</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836=
">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_pm_r=
pm@dpms-non-lpsp.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_pm_rpm@dpms-non-lpsp.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-5/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_rpm@universal-planes-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-exceed-sf.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_psr2_sf@psr2-over=
lay-plane-move-continuous-exceed-sf.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_psr@psr-sprite-render.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-8/igt@kms_psr@psr-sprite-render.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
>Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406=
">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-159096v1/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414"=
>Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@kms_tiled_display@basic-test=
-pattern.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-159096v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_create@multigpu-create-massive-size.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-vm-d=
estroy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug@multigpu-basic-cl=
ient.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159096v1/shard-bmg-8/igt@xe_eudebug@multigpu-basic-client.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">I=
ntel XE#4837</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_eudebug_online@pagefault-=
one-of-many.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-man=
y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_eudebug_online@tdctl-param=
eters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_exec_=
basic@many-execqueues-null-defer-bind.html">PASS</a> -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_exe=
c_basic@many-execqueues-null-defer-bind.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_ba=
sic@many-execqueues-null-defer-bind.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +433 othe=
r tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_basic@multigpu-m=
any-execqueues-many-vm-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_multi_queue@one-queu=
e-preempt-mode-fault-userptr.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_multi_queue@o=
ne-queue-preempt-mode-fault-userptr.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +7 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/ig=
t@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5=
786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-multi-=
fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_=
system_allocator@process-many-large-execqueues-malloc-multi-fault.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
96v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues=
-malloc-multi-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +329 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-159096v1/shard-bmg-7/igt@xe_exec_system_allocator@thre=
ads-many-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-mmap-huge.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_exec_system=
_allocator@threads-shared-vm-many-large-mmap-huge.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-8/igt@xe_fault_injection@exec-queu=
e-create-fail-xe_pxp_exec_queue_add.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_fault_injec=
tion@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_pat@pat-index-xelpg.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15909=
6v1/shard-bmg-8/igt@xe_pat@pat-index-xelpg.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_eng=
ine_class_video_decode0.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_video_decode0.html">P=
ASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59096v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_en=
gine_class_video_decode0.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-1/igt@xe_pmu@engine-activity-ac=
curacy-90@engine-drm_xe_engine_class_video_decode0.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251=
</a>) +2 other tests ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_pxp@pxp-stale-queue-post-=
suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159096v1/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/605=
4">Intel XE#6054</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-f=
lip-events-linear-atomic@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
096v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard=
-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>) +1 other =
test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-5/igt@kms_setm=
ode@basic@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-5/igt@kms_setm=
ode@basic@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_setm=
ode@basic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_s=
etmode@basic@pipe-b-hdmi-a-3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-=
plane-with-filter:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_shar=
pness_filter@invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filt=
er.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4537">Intel XE#4537</a>) -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_sharpness_filter@=
invalid-plane-with-filter@pipe-a-edp-1-invalid-plane-with-filter.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/s=
hard-lnl-2/igt@kms_sharpness_filter@invalid-plane-with-filter@pipe-a-edp-1-=
invalid-plane-with-filter.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159096v1/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-id=
x-uc-multi-vma.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159096v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-=
madvise-pat-idx-uc-multi-vma.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_comput=
e0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-4/igt@xe_pmu@e=
ngine-activity-accuracy-50@engine-drm_xe_engine_class_compute0.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">In=
tel XE#6251</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159096v1/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-d=
rm_xe_engine_class_compute0.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-8/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054">Intel XE#6=
054</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/66=
76">Intel XE#6676</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159096v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-=
flip-events-linear-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6676">Intel XE#6676</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms=
_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@4-tiled=
-32bpp-rotate-90.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2327">Intel XE#2327</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests=
 ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-as=
ync-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-159096v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-ro=
tate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-=
bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-159096v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-1920=
x1080p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159096v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-3-displays-1=
920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 othe=
r test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159096v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/=
igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_=
ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#655=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_ccs@=
bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5=
/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@=
crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/=
shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-b=
mg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-=
1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#34=
32</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-=
bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5=
/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_cham=
elium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_chamelium_color@ctm-limited-range.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_chamel=
ium_color@ctm-limited-range.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_cham=
elium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5=
/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@km=
s_chamelium_edid@dp-edid-resolution-list.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_cham=
elium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_cont=
ent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@k=
ms_content_protection@dp-mst-type-1.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_content_pr=
otection@dp-mst-type-1.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_content=
_protection@srm.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_content_protection@srm.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
78">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_curs=
or_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_curs=
or_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/ig=
t@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_curso=
r_crc@cursor-onscreen-512x170.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_curs=
or_crc@cursor-sliding-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@km=
s_cursor_crc@cursor-sliding-64x21.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_cursor_crc@c=
ursor-sliding-64x21.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2320">Intel XE#2320</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other te=
sts ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_=
dp_link_training@non-uhbr-mst.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_dp_link_training=
@non-uhbr-mst.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_dp_li=
nktrain_fallback@dsc-fallback.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_dsc@=
dsc-with-output-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_ds=
c@dsc-with-output-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_dsc@dsc-with-output-=
formats.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2244">Intel XE#2244</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v=
1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59096v1/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-=
area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_featu=
re_discovery@dp-mst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2375">Intel XE#2375</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2380">Intel XE#2380</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp=
-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_flip_sc=
aled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2380">Intel XE#2380</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Int=
el XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp=
-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-159096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-ind=
fb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-off=
screen-pri-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1=
1 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1590=
96v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-=
pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pl=
flip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primsc=
rn-shrfb-plflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +21 other t=
ests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159096v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_hdr@=
bpc-switch-dpms.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_hdr@bpc-sw=
itch-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_join=
er@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shar=
d-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@km=
s_joiner@basic-force-ultra-joiner.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_join=
er@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_joi=
ner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6590">Intel XE#6590</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard=
-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/ig=
t@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5624">Intel XE#5624</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pla=
ne_multiple@2x-tiling-y.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_plane_multiple@2x-tili=
ng-y.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/sha=
rd-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/ig=
t@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#33=
07</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
096v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-5.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159096v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-down=
scale-factor-0-5.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#688=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
096v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_ba=
cklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@kms_p=
m_backlight@fade-with-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_pm_backlight@fad=
e-with-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr2=
_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/=
shard-bmg-5/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-=
3/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@kms_psr2=
_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">In=
tel XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-159096v1/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dm=
g-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg=
-3/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr2_su@=
page_flip-xrgb8888.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_psr@=
pr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/=
shard-bmg-3/igt@kms_psr@pr-primary-render.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_psr@=
pr-primary-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +6 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_psr@=
psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/sha=
rd-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel X=
E#2414</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159096v1/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-ove=
rlay.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-159096v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2414">Intel XE#2414</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-b=
mg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-=
5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#23=
30</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#390=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159=
096v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shar=
d-bmg-3/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@km=
s_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">In=
tel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3=
/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@km=
s_scaling_modes@scaling-mode-full-aspect.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_setm=
ode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6361">Intel XE#6361</a>) -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_setmode@basic.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
9096v1/shard-bmg-5/igt@kms_setmode@basic.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@kms_shar=
pness_filter@filter-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@k=
ms_sharpness_filter@filter-modifiers.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_vrr@flip-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@kms_vrr@=
flip-basic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@kms_vrr@fli=
p-basic-fastset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html">S=
KIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
99">Intel XE#1499</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-3/igt@xe_eudeb=
ug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_e=
udebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_eudeb=
ug@basic-vm-bind-ufence-reconnect.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/=
igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_e=
udebug@basic-vm-bind-ufence-reconnect.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#655=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_eudeb=
ug@vm-bind-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_eudebug@vm=
-bind-clear.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_eudebug@vm-bind-clear.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">In=
tel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_eudeb=
ug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard=
-bmg-1/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_e=
udebug_online@basic-breakpoint.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_eudeb=
ug_online@set-breakpoint-faultable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v=
1/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-=
5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg=
-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/ig=
t@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) +7 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#68=
74</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
59096v1/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-=
invalidate.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-m=
ode-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +21 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_exec_=
multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel =
XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-159096v1/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-faul=
t-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_=
system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-=
bmg-3/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bm=
g-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE=
#5007</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_exec_=
system_allocator@process-many-mmap-free-huge.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/sh=
ard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4=
943</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
159096v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-h=
uge-nomemset.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many=
-large-mmap-huge-nomemset.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +14 o=
ther tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_mmap@small-bar.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; (<a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pat@pat-index=
-xelp.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-159096v1/shard-bmg-3/igt@xe_pat@pat-index-xelp.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#22=
45</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/igt@xe_pm@d3co=
ld-multiple-execs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-7/igt@xe_pm@s4=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_pm@s4-d3c=
old-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-lnl-3/igt@xe_pmu@e=
ngine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/62=
51">Intel XE#6251</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-159096v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@e=
ngine-drm_xe_engine_class_video_enhance0.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-lnl-1/igt@xe_pmu@en=
gine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/62=
51">Intel XE#6251</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-8/igt@xe_pxp@p=
xp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bm=
g-5/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-1/=
igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-1/igt@xe_pxp@p=
xp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/=
igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4253-2dc4a4ece453df925f995df5eac747a29081c180/shard-bmg-5/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-5/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-159096v1/shard-bmg-3/igt@xe_query@multigpu-quer=
y-mem-usage.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests ( 2 sk=
ip )</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4253-2dc4a4ece453df925f995df5eac747a29081c180 -&gt; xe-pw-159=
096v1</li>
</ul>
<p>IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4253-2dc4a4ece453df925f995df5eac747a29081c180: 2dc4a4ece453df925f995df=
5eac747a29081c180<br />
  xe-pw-159096v1: 159096v1</p>

</body>
</html>

--===============5262214547997196307==--
