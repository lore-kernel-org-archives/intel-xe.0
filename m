Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35D1CD4F3D
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 16:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CC4910E190;
	Wed, 20 May 2026 16:58:12 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBFB10E190;
 Wed, 20 May 2026 16:58:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5063955820128190676=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/atomic=3A_track_indivi?=
 =?utf-8?q?dual_colorop_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 May 2026 16:58:11 -0000
Message-ID: <177929629156.92320.16882858394782379877@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260520073827.3395745-1-chaitanya.kumar.borah@intel.com>
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

--===============5063955820128190676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: track individual colorop updates
URL   : https://patchwork.freedesktop.org/series/166922/
State : failure

== Summary ==

CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe_FULL -> xe-pw-166922v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166922v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166922v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166922v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][1] -> [CRASH][2] +4 other tests crash
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2:
    - shard-lnl:          ([PASS][3], [PASS][4]) -> [FAIL][5] +19 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-5/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2:
    - shard-bmg:          [PASS][6] -> [FAIL][7] +15 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +19 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-1.html

  * igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          ([PASS][10], [PASS][11]) -> [FAIL][12] +29 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in xe-pw-166922v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          ([PASS][13], [PASS][14]) -> [FAIL][15] ([Intel XE#7445])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@intel_hwmon@hwmon-write.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@intel_hwmon@hwmon-write.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          ([PASS][16], [PASS][17]) -> [FAIL][18] ([Intel XE#3718] / [Intel XE#6078])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:
    - shard-bmg:          ([PASS][19], [PASS][20]) -> [FAIL][21] ([Intel XE#6078])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:
    - shard-bmg:          ([PASS][22], [PASS][23]) -> [DMESG-FAIL][24] ([Intel XE#7774]) +1 other test dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2327])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1124]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7679])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325] / [Intel XE#7358])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2252])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_color@ctm-red-to-blue:
    - shard-bmg:          [PASS][31] -> [ABORT][32] ([Intel XE#5545] / [Intel XE#7774] / [Intel XE#7814])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_color@ctm-red-to-blue.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-red-to-blue.html

  * igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3:
    - shard-bmg:          [PASS][33] -> [DMESG-WARN][34] ([Intel XE#7774])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3.html

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2:
    - shard-bmg:          [PASS][35] -> [ABORT][36] ([Intel XE#5545] / [Intel XE#7814])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_color@ctm-red-to-blue@pipe-b-dp-2.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-red-to-blue@pipe-b-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2390] / [Intel XE#6974])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2321] / [Intel XE#7355])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][39] -> [DMESG-FAIL][40] ([Intel XE#5545] / [Intel XE#7774])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#301] / [Intel XE#3149])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4141]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#656] / [Intel XE#7905])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2311]) +8 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +11 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7905])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7061])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          ([PASS][50], [PASS][51]) -> [SKIP][52] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7130]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7283])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#1489]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1406])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          ([PASS][58], [PASS][59]) -> [FAIL][60] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          ([PASS][61], [PASS][62]) -> [FAIL][63] ([Intel XE#4227]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_vrr@max-min.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_vrr@max-min.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-5/igt@kms_vrr@max-min.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#7636])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2322] / [Intel XE#7372])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7136])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue.html

  * igt@xe_exec_multi_queue@max-queues-basic:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6874]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@xe_exec_multi_queue@max-queues-basic.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7866]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_system_allocator@many-stride-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6703]) +8 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#6703]) +83 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@twice-mmap-free-madvise:
    - shard-bmg:          ([PASS][74], [PASS][75]) -> [SKIP][76] ([Intel XE#6703]) +67 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7138]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#7736]) +2 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#6964])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7793])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#944])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#6569])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-bmg:          ([PASS][84], [FAIL][85]) -> [PASS][86]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@core_getversion@all-cards.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@core_getversion@all-cards.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@core_getversion@all-cards.html

  * igt@fbdev@read:
    - shard-bmg:          ([PASS][87], [FAIL][88]) ([Intel XE#7859]) -> [PASS][89]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@fbdev@read.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@fbdev@read.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@fbdev@read.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][90] ([Intel XE#7084]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          ([PASS][92], [FAIL][93]) ([Intel XE#7949]) -> [PASS][94]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_fbcon_fbt@psr-suspend.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          ([DMESG-FAIL][95], [PASS][96]) ([Intel XE#5545] / [Intel XE#7774]) -> [PASS][97] +1 other test pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][98] ([Intel XE#301]) -> [PASS][99] +2 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][100] ([Intel XE#7915]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          ([SKIP][102], [SKIP][103]) ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][104]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-bmg:          ([PASS][105], [DMESG-FAIL][106]) ([Intel XE#7129] / [Intel XE#7774]) -> [PASS][107]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          ([PASS][108], [INCOMPLETE][109]) -> [PASS][110]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_sequence@queue-idle.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_sequence@queue-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_sequence@queue-idle.html

  * igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:
    - shard-lnl:          ([ABORT][111], [ABORT][112]) ([Intel XE#8044]) -> [PASS][113]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-2/igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-many-large-new:
    - shard-bmg:          ([SKIP][114], [PASS][115]) ([Intel XE#6703]) -> [PASS][116] +266 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-new.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-new.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
    - shard-bmg:          ([FAIL][117], [FAIL][118]) ([Intel XE#7992]) -> [PASS][119] +24 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-bmg:          ([SKIP][120], [PASS][121]) ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][122] +1 other test pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_vm@large-split-binds-536870912.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_vm@large-split-binds-536870912.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@xe_vm@large-split-binds-536870912.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-bmg:          ([SKIP][123], [SKIP][124]) ([Intel XE#2327] / [Intel XE#6703]) -> [SKIP][125] ([Intel XE#2327])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          ([SKIP][126], [SKIP][127]) ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][128] ([Intel XE#6703])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          ([SKIP][129], [SKIP][130]) ([Intel XE#1124]) -> [SKIP][131] ([Intel XE#6703]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          ([SKIP][132], [SKIP][133]) ([Intel XE#1124] / [Intel XE#6703]) -> [SKIP][134] ([Intel XE#1124]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][135] ([Intel XE#1124]) -> [SKIP][136] ([Intel XE#6703])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][137] ([Intel XE#7679]) -> [SKIP][138] ([Intel XE#6703])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          ([SKIP][139], [SKIP][140]) ([Intel XE#6703] / [Intel XE#7679]) -> [SKIP][141] ([Intel XE#7679])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][142] ([Intel XE#2887]) -> [SKIP][143] ([Intel XE#6703]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          ([SKIP][144], [SKIP][145]) ([Intel XE#2887] / [Intel XE#6703]) -> [SKIP][146] ([Intel XE#2887]) +5 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          ([SKIP][147], [SKIP][148]) ([Intel XE#3432] / [Intel XE#6703]) -> [SKIP][149] ([Intel XE#3432])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          ([SKIP][150], [SKIP][151]) ([Intel XE#2325] / [Intel XE#6703] / [Intel XE#7358]) -> [SKIP][152] ([Intel XE#2325] / [Intel XE#7358])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-bmg:          ([SKIP][153], [SKIP][154]) ([Intel XE#2252] / [Intel XE#6703]) -> [SKIP][155] ([Intel XE#2252]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-bmg:          [SKIP][156] ([Intel XE#2252]) -> [SKIP][157] ([Intel XE#6703])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_chamelium_frames@dp-crc-multiple.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          ([SKIP][158], [SKIP][159]) ([Intel XE#2252]) -> [SKIP][160] ([Intel XE#6703]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          ([SKIP][161], [SKIP][162]) ([Intel XE#2390] / [Intel XE#6703] / [Intel XE#6974]) -> [SKIP][163] ([Intel XE#2390] / [Intel XE#6974]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          ([SKIP][164], [SKIP][165]) ([Intel XE#7642]) -> [SKIP][166] ([Intel XE#6703])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_content_protection@mei-interface.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_content_protection@mei-interface.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          ([SKIP][167], [SKIP][168]) ([Intel XE#2320] / [Intel XE#6703]) -> [SKIP][169] ([Intel XE#2320]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-lnl:          [SKIP][170] ([Intel XE#1424]) -> [ABORT][171] ([Intel XE#8007])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-32x10.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          ([SKIP][172], [SKIP][173]) ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][174] ([Intel XE#6703])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          ([SKIP][175], [SKIP][176]) ([Intel XE#2321] / [Intel XE#6703] / [Intel XE#7355]) -> [SKIP][177] ([Intel XE#2321] / [Intel XE#7355])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][178] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][179] ([Intel XE#6703])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          ([SKIP][180], [SKIP][181]) ([Intel XE#4354] / [Intel XE#5870] / [Intel XE#6703]) -> [SKIP][182] ([Intel XE#4354] / [Intel XE#5870])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          ([SKIP][183], [SKIP][184]) ([Intel XE#2244]) -> [SKIP][185] ([Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_dsc@dsc-basic.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_dsc@dsc-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          ([SKIP][186], [SKIP][187]) ([Intel XE#4156] / [Intel XE#6703] / [Intel XE#7425]) -> [SKIP][188] ([Intel XE#4156] / [Intel XE#7425])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          ([SKIP][189], [SKIP][190]) ([Intel XE#2373] / [Intel XE#6703] / [Intel XE#7448]) -> [SKIP][191] ([Intel XE#2373] / [Intel XE#7448])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_feature_discovery@display-3x.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          ([PASS][192], [SKIP][193]) ([Intel XE#6703]) -> [DMESG-FAIL][194] ([Intel XE#5545] / [Intel XE#7774])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][195] ([Intel XE#301]) -> [FAIL][196] ([Intel XE#301] / [Intel XE#3149])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          ([SKIP][197], [SKIP][198]) ([Intel XE#6703] / [Intel XE#7179]) -> [SKIP][199] ([Intel XE#7179])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          ([SKIP][200], [SKIP][201]) ([Intel XE#6703] / [Intel XE#7178] / [Intel XE#7351]) -> [SKIP][202] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          ([SKIP][203], [SKIP][204]) ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][205] ([Intel XE#6703]) +1 other test skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][206], [SKIP][207]) ([Intel XE#2311] / [Intel XE#6557] / [Intel XE#6703]) -> [SKIP][208] ([Intel XE#2311]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][209] ([Intel XE#2311]) -> [SKIP][210] ([Intel XE#6703]) +7 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          ([SKIP][211], [SKIP][212]) ([Intel XE#2311] / [Intel XE#6703]) -> [SKIP][213] ([Intel XE#2311]) +22 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          ([SKIP][214], [SKIP][215]) ([Intel XE#2311]) -> [SKIP][216] ([Intel XE#6703]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          ([SKIP][217], [SKIP][218]) ([Intel XE#4141]) -> [SKIP][219] ([Intel XE#6703]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][220] ([Intel XE#4141]) -> [SKIP][221] ([Intel XE#6703]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          ([SKIP][222], [SKIP][223]) ([Intel XE#4141] / [Intel XE#6703]) -> [SKIP][224] ([Intel XE#4141]) +6 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2313]) -> [SKIP][226] ([Intel XE#6703]) +4 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:
    - shard-bmg:          ([SKIP][227], [SKIP][228]) ([Intel XE#6703] / [Intel XE#7061] / [Intel XE#7356]) -> [SKIP][229] ([Intel XE#7061] / [Intel XE#7356])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:
    - shard-bmg:          ([SKIP][230], [SKIP][231]) ([Intel XE#2313]) -> [SKIP][232] ([Intel XE#6703]) +9 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:
    - shard-bmg:          ([SKIP][233], [SKIP][234]) ([Intel XE#6703] / [Intel XE#7061]) -> [SKIP][235] ([Intel XE#7061]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          ([SKIP][236], [SKIP][237]) ([Intel XE#7061]) -> [SKIP][238] ([Intel XE#6703])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          ([SKIP][239], [SKIP][240]) ([Intel XE#2313] / [Intel XE#6703]) -> [SKIP][241] ([Intel XE#6703])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          ([SKIP][242], [SKIP][243]) ([Intel XE#2313] / [Intel XE#6703]) -> [SKIP][244] ([Intel XE#2313]) +16 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          ([SKIP][245], [SKIP][246]) ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][247] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          ([SKIP][248], [SKIP][249]) ([Intel XE#7916]) -> [SKIP][250] ([Intel XE#7915]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][251] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][252] ([Intel XE#6703])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          ([SKIP][253], [SKIP][254]) ([Intel XE#2486] / [Intel XE#6703]) -> [SKIP][255] ([Intel XE#2486]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_panel_fitting@legacy.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_panel_fitting@legacy.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-bmg:          ([SKIP][256], [SKIP][257]) ([Intel XE#6703] / [Intel XE#7283]) -> [SKIP][258] ([Intel XE#7283]) +3 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][259] ([Intel XE#7283]) -> [SKIP][260] ([Intel XE#6703])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][261] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][262] ([Intel XE#6703])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_pm_backlight@bad-brightness.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          ([SKIP][263], [SKIP][264]) ([Intel XE#2938] / [Intel XE#6703] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][265] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          ([SKIP][266], [SKIP][267]) ([Intel XE#6703] / [Intel XE#7794]) -> [SKIP][268] ([Intel XE#7794])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          ([SKIP][269], [SKIP][270]) ([Intel XE#1489] / [Intel XE#6703]) -> [SKIP][271] ([Intel XE#6703])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          ([SKIP][272], [SKIP][273]) ([Intel XE#1489] / [Intel XE#6703]) -> [SKIP][274] ([Intel XE#1489]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          ([SKIP][275], [SKIP][276]) ([Intel XE#1489]) -> [SKIP][277] ([Intel XE#6703])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          ([SKIP][278], [SKIP][279]) ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][280] ([Intel XE#6703])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          ([SKIP][281], [SKIP][282]) ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) -> [SKIP][283] ([Intel XE#6703])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-bmg:          ([SKIP][284], [SKIP][285]) ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][286] ([Intel XE#6703]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_psr@fbc-psr2-sprite-render.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_psr@fbc-psr2-sprite-render.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          ([SKIP][287], [SKIP][288]) ([Intel XE#2234] / [Intel XE#2850] / [Intel XE#6703]) -> [SKIP][289] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_psr@psr2-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr@psr2-suspend.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          ([SKIP][290], [SKIP][291]) ([Intel XE#2330] / [Intel XE#5813] / [Intel XE#6703]) -> [SKIP][292] ([Intel XE#2330] / [Intel XE#5813])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          ([SKIP][293], [SKIP][294]) ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][295] ([Intel XE#6703])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:
    - shard-bmg:          [SKIP][296] ([Intel XE#6503]) -> [SKIP][297] ([Intel XE#6703])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          ([SKIP][298], [SKIP][299]) ([Intel XE#6503] / [Intel XE#6703]) -> [SKIP][300] ([Intel XE#6503])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][301] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][302] ([Intel XE#1729] / [Intel XE#7424])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][303] ([Intel XE#1499]) -> [SKIP][304] ([Intel XE#6703])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_vrr@flip-suspend.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          ([SKIP][305], [SKIP][306]) ([Intel XE#6599] / [Intel XE#6703]) -> [SKIP][307] ([Intel XE#6599])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_compute@ccs-mode-basic.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-bmg:          [SKIP][308] ([Intel XE#7636]) -> [SKIP][309] ([Intel XE#6703])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_eudebug_online@debugger-reopen.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          ([SKIP][310], [SKIP][311]) ([Intel XE#7636]) -> [SKIP][312] ([Intel XE#6703]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          ([SKIP][313], [SKIP][314]) ([Intel XE#6703] / [Intel XE#7636]) -> [SKIP][315] ([Intel XE#7636]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_eudebug_online@single-step-one.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_eudebug_online@single-step-one.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          ([SKIP][316], [SKIP][317]) ([Intel XE#2322] / [Intel XE#6703] / [Intel XE#7372]) -> [SKIP][318] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-bmg:          ([SKIP][319], [SKIP][320]) ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][321] ([Intel XE#6703]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:
    - shard-bmg:          ([SKIP][322], [SKIP][323]) ([Intel XE#6703] / [Intel XE#7136]) -> [SKIP][324] ([Intel XE#6703])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          ([SKIP][325], [SKIP][326]) ([Intel XE#7136]) -> [SKIP][327] ([Intel XE#6703]) +1 other test skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          ([SKIP][328], [SKIP][329]) ([Intel XE#6703] / [Intel XE#7136]) -> [SKIP][330] ([Intel XE#7136]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem:
    - shard-bmg:          ([SKIP][331], [SKIP][332]) ([Intel XE#6703] / [Intel XE#6874]) -> [SKIP][333] ([Intel XE#6703])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:
    - shard-bmg:          ([SKIP][334], [SKIP][335]) ([Intel XE#6874]) -> [SKIP][336] ([Intel XE#6703]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][337] ([Intel XE#6874]) -> [SKIP][338] ([Intel XE#6703]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          ([SKIP][339], [SKIP][340]) ([Intel XE#6703] / [Intel XE#6874]) -> [SKIP][341] ([Intel XE#6874]) +12 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-userptr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          ([SKIP][342], [SKIP][343]) ([Intel XE#7866]) -> [SKIP][344] ([Intel XE#6703])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          ([SKIP][345], [SKIP][346]) ([Intel XE#7138]) -> [SKIP][347] ([Intel XE#6703]) +1 other test skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-fd-basic:
    - shard-bmg:          ([SKIP][348], [SKIP][349]) ([Intel XE#6703] / [Intel XE#7138]) -> [SKIP][350] ([Intel XE#7138]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-basic.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          ([SKIP][351], [SKIP][352]) ([Intel XE#6703] / [Intel XE#7138]) -> [SKIP][353] ([Intel XE#6703])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          [SKIP][354] ([Intel XE#7138]) -> [SKIP][355] ([Intel XE#6703])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:
    - shard-bmg:          ([SKIP][356], [PASS][357]) ([Intel XE#6703]) -> [SKIP][358] ([Intel XE#6703]) +15 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          ([SKIP][359], [SKIP][360]) ([Intel XE#6703] / [Intel XE#7793]) -> [SKIP][361] ([Intel XE#7793])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_page_reclaim@binds-1g-partial.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          ([SKIP][362], [SKIP][363]) ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][364] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_peer2peer@read.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_peer2peer@read.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          ([SKIP][365], [SKIP][366]) ([Intel XE#4733] / [Intel XE#6703] / [Intel XE#7417]) -> [SKIP][367] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          ([ABORT][368], [ABORT][369]) ([Intel XE#7914]) -> [ABORT][370] ([Intel XE#8007])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_wedged@wedged-mode-toggle.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7129
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7859]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7859
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7949]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7949
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8044
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_8921 -> IGT_8923
  * Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -> xe-pw-166922v1

  IGT_8921: 8921
  IGT_8923: 3cb6109b3a0596ce448305acc233064c88680eb9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2d89c776a6b4b323fe
  xe-pw-166922v1: 166922v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/index.html

--===============5063955820128190676==
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
<tr><td><b>Series:</b></td><td>drm/atomic: track individual colorop updates=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/166922/">https://patchwork.freedesktop.org/series/166922/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166922v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166922v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe_FULL -&gt; xe-pw-166922v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166922v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-166922v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1669=
22v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_colo=
r@ctm-red-to-blue@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@c=
tm-red-to-blue@pipe-d-hdmi-a-3.html">CRASH</a> +4 other tests crash</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_col=
or_pipeline@plane-ctm3x4@pipe-a-plane-2.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-lnl-4/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2.html=
">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166922v1/shard-lnl-5/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-2.h=
tml">FAIL</a> +19 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_colo=
r_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-=
6/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-2.html">FAIL=
</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_colo=
r_pipeline@plane-lut1d-lut1d@pipe-a-plane-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@k=
ms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-1.html">FAIL</a> +19 other=
 tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_pro=
perties@colorop-properties-atomic@pipe-c-hdmi-a-3.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_properties@colorop-properties-atomi=
c@pipe-c-hdmi-a-3.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_properties@colorop-pro=
perties-atomic@pipe-c-hdmi-a-3.html">FAIL</a> +29 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166922v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@intel_h=
wmon@hwmon-write.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt=
@intel_hwmon@hwmon-write.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@intel_hwmon@hwmon-w=
rite.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7445">Intel XE#7445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_as=
ync_flips@alternate-sync-async-flip-atomic.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776=
a6b4b323fe/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic=
.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-166922v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-a=
tomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e=
63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_async_flips@alternate-sync-async=
-flip-atomic@pipe-c-dp-2.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_async_flips@alt=
ernate-sync-async-flip-atomic@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3:<=
/p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364be=
ae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_atomic_transition@plane-all=
-modeset-transition@pipe-a-hdmi-a-3.html">PASS</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-3.html">DMESG-FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">=
Intel XE#7774</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_big_fb@4-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-cmp=
-planar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_colo=
r@ctm-red-to-blue.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-red-to-blue.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7774">Intel XE#7774</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_colo=
r@ctm-red-to-blue@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@c=
tm-red-to-blue@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_colo=
r@ctm-red-to-blue@pipe-b-dp-2.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_color@ctm-r=
ed-to-blue@pipe-b-dp-2.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip=
@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_fl=
ip@2x-dpms-vs-vblank-race@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Inte=
l XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_pip=
e_crc_basic@disable-crc-after-crtc.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323=
fe/shard-bmg-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1=
/shard-bmg-2/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel =
XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_psr2_sf@psr2-primary-plan=
e-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_psr@fbc-pr-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_vrr=
@flip-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@kms_=
vrr@flip-basic.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-lnl-1/igt@kms_vrr@flip-basic.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">=
Intel XE#4227</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/igt@kms_vrr=
@max-min.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_vrr=
@max-min.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-166922v1/shard-lnl-5/igt@kms_vrr@max-min.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#=
4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-vm-=
destroy-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_fault_mode@once-multi=
-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@xe_exec_multi_queue@max-queue=
s-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@xe_exec_reset@cm-multi-queue-=
cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7866">Intel XE#7866</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@many=
-stride-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-no=
memset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-malloc-nomemset.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
922v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execq=
ueues-malloc-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +83 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_exec=
_system_allocator@twice-large-malloc-bo-unmap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/ig=
t@xe_exec_system_allocator@twice-large-malloc-bo-unmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6=
557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec=
_system_allocator@twice-mmap-free-madvise.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a=
6b4b323fe/shard-bmg-4/igt@xe_exec_system_allocator@twice-mmap-free-madvise.=
html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-166922v1/shard-bmg-2/igt@xe_exec_system_allocator@twice-mmap-free-mad=
vise.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +67 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_live_=
ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_li=
ve_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7736">Intel XE#7736</a>) +2 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_page_reclaim@pat-index-xd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-9/igt@xe_query@multigpu-query-uc-fw=
-version-guc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolati=
on.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@core_ge=
tversion@all-cards.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/i=
gt@core_getversion@all-cards.html">FAIL</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@core_getversion=
@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@fbdev@r=
ead.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@fbdev@read.h=
tml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7859">Intel XE#7859</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@fbdev@read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard=
-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-8/igt@kms_fbc=
on_fbt@psr-suspend.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-4/i=
gt@kms_fbcon_fbt@psr-suspend.html">FAIL</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7949">Intel XE#7949</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@k=
ms_fbcon_fbt@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">DMESG-FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c7=
76a6b4b323fe/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check-interruptible.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5545">Intel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-4/igt@kms_flip@2x-plai=
n-flip-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-4/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_hdr@=
static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1669=
22v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb1616=
1616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_pla=
ne_scaling@intel-max-src-size.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307"=
>Intel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_rot=
ation_crc@multiplane-rotation-cropping-top.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776=
a6b4b323fe/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-to=
p.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7129">Intel XE#7129</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_seq=
uence@queue-idle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt=
@kms_sequence@queue-idle.html">INCOMPLETE</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_sequence@=
queue-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-1/igt@xe_exec=
_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">ABORT</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364bea=
e8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@xe_exec_system_allocator@many-st=
ride-mmap-shared-remap-dontunmap.html">ABORT</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8044">Intel XE#8044</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-2/=
igt@xe_exec_system_allocator@many-stride-mmap-shared-remap-dontunmap.html">=
PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_system_allocator@threads-many-large-new.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6=
b4b323fe/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-large-new.ht=
ml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@xe_exec_system_allocator@threads=
-many-large-new.html">PASS</a> +266 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_srio=
v_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe=
/shard-bmg-9/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel X=
E#7992</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166922v1/shard-bmg-4/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">PA=
SS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_vm@l=
arge-split-binds-536870912.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-9/igt@xe_vm@large-split-binds-536870912.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166922v1/shard-bmg-4/igt@xe_vm@large-split-binds-536870912.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big=
_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sha=
rd-bmg-9/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_big=
_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c=
776a6b4b323fe/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
0-hflip.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e=
63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32b=
pp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_b=
ig_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shar=
d-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-166922v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
>Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms=
_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_bw@=
connected-linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#767=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
922v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-2560=
x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_bw@=
connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e6=
3a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displ=
ays-target-2160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-=
3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679"=
>Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-=
2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89=
c776a6b4b323fe/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen=
12-rc-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2887">Intel XE#2887</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>=
) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_ccs=
@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3432">Intel XE#3432</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_ccs@crc-primary-=
suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_cha=
melium_color@ctm-0-50.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-=
2/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358"=
>Intel XE#7358</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">I=
ntel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cha=
melium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c=
776a6b4b323fe/shard-bmg-9/igt@kms_chamelium_edid@hdmi-edid-change-during-hi=
bernate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2252">Intel XE#2252</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/igt@kms_cham=
elium_edid@hdmi-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_cham=
elium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@km=
s_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_ch=
amelium_hpd@dp-hpd.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/i=
gt@kms_chamelium_hpd@dp-hpd.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@km=
s_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_con=
tent_protection@dp-mst-type-1.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6974">Intel XE#6974</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_content_protection@dp-=
mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_con=
tent_protection@mei-interface.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-8/igt@kms_content_protection@mei-interface.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1669=
22v1/shard-bmg-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_cur=
sor_crc@cursor-offscreen-128x42.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/=
shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#=
2320</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x=
42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-5/igt@kms_curs=
or_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-8/igt@k=
ms_cursor_crc@cursor-offscreen-32x10.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_cur=
sor_crc@cursor-random-512x170.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#232=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355=
">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_crc@cursor-random-512x170.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_cur=
sor_crc@cursor-sliding-512x512.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/s=
hard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#23=
21</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7355">Intel XE#7355</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sl=
iding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_cursor_legacy@sh=
ort-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_dp_=
link_training@uhbr-sst.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg=
-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166922v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">=
Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_ds=
c@dsc-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_=
dsc@dsc-basic.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_dsc@dsc-basi=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fbc=
on_fbt@fbc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_f=
bcon_fbt@fbc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard=
-bmg-7/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fea=
ture_discovery@display-3x.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-=
bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel X=
E#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7448">Intel XE#7448</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_feature_discovery@display-3x.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fli=
p@2x-dpms-vs-vblank-race.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-b=
mg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard=
-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">In=
tel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-lnl-1=
/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fli=
p_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8=
f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-lin=
ear-to-32bpp-linear-reflect-x.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/sh=
ard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect=
-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae=
8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yt=
ileccs-to-64bpp-ytile-upscaling.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Inte=
l XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-166922v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8=
f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yti=
le-to-16bpp-ytile-downscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/sh=
ard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscali=
ng.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae=
8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-166922v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1669=
22v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-indfb-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10=
/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">I=
ntel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364bea=
e8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/i=
gt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_fr=
ontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6=
e63a2d89c776a6b4b323fe/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offs=
creen-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_f=
rontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1669=
22v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6=
e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-prim=
scrn-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-=
bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-in=
dfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_fro=
ntbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c=
776a6b4b323fe/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-d=
raw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-=
1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-blt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel =
XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323=
fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.html">SKIP</a>=
) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Int=
el XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-rte.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr=
161616f-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-8/=
igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">In=
tel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-10/igt@kms_fr=
ontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb=
161616f-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_frontbuff=
er_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d=
89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-s=
pr-indfb-move.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313">Intel XE#2313</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@km=
s_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_fro=
ntbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364bea=
e8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-=
2p-scndscrn-cur-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-dra=
w-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_hdr=
@brightness-with-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4=
/igt@kms_hdr@brightness-with-hdr.html">SKIP</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1=
/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel =
XE#7915</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_hdr=
@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi=
-a-3-xrgb16161616f.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-3/igt@kms_hdr@bri=
ghtness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#=
7443</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166922v1/shard-bmg-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pan=
el_fitting@legacy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/ig=
t@kms_panel_fitting@legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard=
-bmg-1/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_pla=
ne@pixel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c77=
6a6b4b323fe/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modif=
ier.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_plane@pi=
xel-format-4-tiled-dg2-rc-ccs-modifier.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_plan=
e@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1=
/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922=
v1/shard-bmg-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_pm_=
backlight@brightness-with-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/s=
hard-bmg-2/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#29=
38</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7760">Intel XE#7760</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-5/igt@kms_pm_bac=
klight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#=
7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_pm_=
dc@dc3co-vpb-simulation.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bm=
g-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#77=
94</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
6922v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#77=
94</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr=
2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c7=
76a6b4b323fe/shard-bmg-9/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg=
-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr2_s=
f@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_psr=
2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c7=
76a6b4b323fe/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg=
-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-6/igt@kms_psr2_s=
f@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_psr=
2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe=
/shard-bmg-4/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel X=
E#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166922v1/shard-bmg-2/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@kms_psr=
2_su@page_flip-p010.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/=
igt@kms_psr2_su@page_flip-p010.html">SKIP</a>) (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/s=
hard-bmg-2/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_psr=
@fbc-pr-cursor-plane-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-9/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel=
 XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@kms_psr=
@fbc-psr2-sprite-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bm=
g-5/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#28=
50</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
6922v1/shard-bmg-2/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_psr=
@psr2-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@km=
s_psr@psr2-suspend.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1=
/shard-bmg-1/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5813">Intel XE#5813</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5=
813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_rotation_crc@pri=
mary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-nearest-neighbor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-5/igt@kms_shar=
pness_filter@invalid-filter-with-nearest-neighbor.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1669=
22v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-nearest-neigh=
bor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@kms_sha=
rpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89=
c776a6b4b323fe/shard-bmg-2/igt@kms_sharpness_filter@invalid-filter-with-sca=
ling-mode.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6503">Intel XE#6503</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-1/igt@kms_sh=
arpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shar=
d-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_comp=
ute@ccs-mode-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/i=
gt@xe_compute@ccs-mode-basic.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/sha=
rd-bmg-1/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_eudeb=
ug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_eu=
debug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_eude=
bug_online@set-breakpoint-sigint-debugger.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a=
6b4b323fe/shard-bmg-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7636">Intel XE#7636</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoi=
nt-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_eude=
bug_online@single-step-one.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard=
-bmg-2/igt@xe_eudebug_online@single-step-one.html">SKIP</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel=
 XE#7636</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-166922v1/shard-bmg-1/igt@xe_eudebug_online@single-step-one.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">In=
tel XE#7636</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6=
b4b323fe/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_e=
xec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel X=
E#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-3/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e=
63a2d89c776a6b4b323fe/shard-bmg-5/igt@xe_exec_basic@multigpu-once-bindexecq=
ueue-userptr-invalidate.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bm=
g-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec=
_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d=
89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-q=
ueue-prefetch.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe=
_exec_fault_mode@many-execqueues-multi-queue-prefetch.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec=
_fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-us=
erptr-invalidate-imm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_f=
ault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec=
_fault_mode@twice-multi-queue.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/sh=
ard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136"=
>Intel XE#7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-166922v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_multi_queue@few-execs-preempt-mode-fault-basic-smem.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e6=
3a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-=
mode-fault-basic-smem.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-=
2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic-smem.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
>Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_exec=
_multi_queue@few-execs-preempt-mode-fault-userptr.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63=
a2d89c776a6b4b323fe/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-m=
ode-fault-userptr.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_mult=
i_queue@few-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_exec_=
multi_queue@many-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Inte=
l XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-166922v1/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-=
fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_multi_queue@two-queues-userptr.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/=
shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
874">Intel XE#6874</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166922v1/shard-bmg-6/igt@xe_exec_multi_queue@two-queues-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6874">Intel XE#6874</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-4/igt@xe_exec=
_reset@cm-multi-queue-gt-reset.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/s=
hard-bmg-6/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#78=
66</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
6922v1/shard-bmg-2/igt@xe_exec_reset@cm-multi-queue-gt-reset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Inte=
l XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec=
_threads@threads-multi-queue-cm-rebind.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4=
b323fe/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7138">Intel XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue=
-cm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-basic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_threads@threads-multi-queue-fd-basic.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b=
323fe/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-fd-basic.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7138">Intel XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-10/igt@xe_exec_threads@threads=
-multi-queue-fd-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-1/igt@xe_exec=
_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a513=
64beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec_threads@threads-mul=
ti-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel =
XE#7138</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-166922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-share=
d-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-6/igt@xe_exec_=
threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#713=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
922v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-inv=
alidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-wq-stress-rebind-bindexecqueue:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_exec=
_threads@threads-wq-stress-rebind-bindexecqueue.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d8=
9c776a6b4b323fe/shard-bmg-1/igt@xe_exec_threads@threads-wq-stress-rebind-bi=
ndexecqueue.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-2/igt@xe_exec_threads@th=
reads-wq-stress-rebind-bindexecqueue.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +15 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_page=
_reclaim@binds-1g-partial.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-=
bmg-2/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel X=
E#7793</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166922v1/shard-bmg-10/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Inte=
l XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-7/igt@xe_peer=
2peer@read.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-9/igt@xe_pe=
er2peer@read.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#=
7353</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
166922v1/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE=
#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-2/igt@xe_pxp@=
pxp-termination-key-update-post-suspend.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b=
4b323fe/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg-7/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7=
417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg-8/igt@xe_wedg=
ed@wedged-mode-toggle.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe/shard-bmg=
-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a>) (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166922v1/shard-bmg=
-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8921 -&gt; IGT_8923</li>
<li>Linux: xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe -&gt; xe-pw-166=
922v1</li>
</ul>
<p>IGT_8921: 8921<br />
  IGT_8923: 3cb6109b3a0596ce448305acc233064c88680eb9 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-5099-81e61a51364beae8f6e63a2d89c776a6b4b323fe: 81e61a51364beae8f6e63a2=
d89c776a6b4b323fe<br />
  xe-pw-166922v1: 166922v1</p>

</body>
</html>

--===============5063955820128190676==--
