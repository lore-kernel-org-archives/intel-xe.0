Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92100C3ABD8
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 02:10:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0E910E75D;
	Thu, 15 May 2025 02:10:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD5010E75D;
 Thu, 15 May 2025 02:10:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1292076252933435728=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Track_FAST=5FREQ_H2Gs_to_r?=
 =?utf-8?q?eport_where_errors_came_from_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 02:10:11 -0000
Message-ID: <174727501120.82427.7182253505754336168@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250512215324.1457009-1-John.C.Harrison@Intel.com>
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

--===============1292076252933435728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Track FAST_REQ H2Gs to report where errors came from (rev2)
URL   : https://patchwork.freedesktop.org/series/148912/
State : failure

== Summary ==

CI Bug Log - changes from xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961_FULL -> xe-pw-148912v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148912v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148912v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148912v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_plane_multiple@tiling-none.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_plane_multiple@tiling-none.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][5] ([Intel XE#455]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         [SKIP][7] ([Intel XE#651]) -> [SKIP][8] +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         [SKIP][9] ([Intel XE#653]) -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][11] ([Intel XE#656]) -> [SKIP][12] +7 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         [SKIP][13] ([Intel XE#346]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         [SKIP][15] ([Intel XE#3309]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-adlp:         [SKIP][17] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr@fbc-psr-suspend.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-adlp:         [SKIP][19] ([Intel XE#3414]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  
Known issues
------------

  Here are the changes found in xe-pw-148912v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#4208])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@core_getversion@all-cards.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@core_getversion@all-cards.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2134])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@fbdev@eof.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@fbdev@eof.html

  * igt@fbdev@pan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2134])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@fbdev@pan.html

  * igt@fbdev@unaligned-write:
    - shard-adlp:         [PASS][26] -> [SKIP][27] ([Intel XE#2134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@fbdev@unaligned-write.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@fbdev@unaligned-write.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#3767]) +7 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2385])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][32] -> [SKIP][33] ([Intel XE#4208] / [i915#2575]) +135 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#3658])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][35] -> [SKIP][36] ([Intel XE#2351] / [Intel XE#4996])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1124]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#787]) +181 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#787]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#3432])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][45] ([Intel XE#3862])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#3432])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][50] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2252]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#373])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#373]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2341])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2320])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#309])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [PASS][60] -> [SKIP][61] ([Intel XE#4996]) +12 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2291]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +4 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#1340]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#3009])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_dp_aux_dev.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2244])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#776])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][70] -> [FAIL][71] ([Intel XE#301])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][72] ([Intel XE#3321])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][73] ([Intel XE#301]) +2 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2316])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2316]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1421])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][78] -> [INCOMPLETE][79] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][80] -> [INCOMPLETE][81] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][82] -> [DMESG-WARN][83] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2293]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#455]) +4 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][87] -> [DMESG-FAIL][88] ([Intel XE#4543])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1874])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#4141]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#2351] / [Intel XE#4208]) +16 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [PASS][94] -> [SKIP][95] ([Intel XE#4947])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2311]) +2 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#651]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#656]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2312]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#656]) +8 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2313]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#2350])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#4208] / [i915#2575]) +19 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#4298])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][106] -> [DMESG-WARN][107] ([Intel XE#4173]) +7 other tests dmesg-warn
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#616])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#2763]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#2763]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2763]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2763]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_prop_blob@basic:
    - shard-adlp:         [PASS][115] -> [SKIP][116] ([Intel XE#4950])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_prop_blob@basic.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_prop_blob@basic.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#1489]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1489])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2893])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1128])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#2850] / [Intel XE#929])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr@psr-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#4692])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#2414])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#3414] / [Intel XE#3904])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][127] ([Intel XE#4689])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#3414] / [Intel XE#3904])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][129] -> [FAIL][130] ([Intel XE#2883]) +2 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1435])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#1499])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#1499])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#4497])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#4837]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#4837])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4837]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1392]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-dg2-set2:     [PASS][139] -> [SKIP][140] ([Intel XE#1392]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1392])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2322])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#4208]) +302 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#288]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][146] -> [DMESG-WARN][147] ([Intel XE#3868])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#4915]) +18 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#4943]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#4208]) +72 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#4943]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][152] -> [FAIL][153] ([Intel XE#5018])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [PASS][154] -> [SKIP][155] ([Intel XE#4945] / [Intel XE#4996]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2229])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#4045])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#1416])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2541] / [Intel XE#3573])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          NOTRUN -> [SKIP][160] ([Intel XE#1420])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#2284] / [Intel XE#366])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2284])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][163] -> [ABORT][164] ([Intel XE#1794])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#4733])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#944])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#4273])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#4351])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-3145728:
    - shard-adlp:         [PASS][169] -> [SKIP][170] ([Intel XE#4945]) +22 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html

  
#### Possible fixes ####

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#2134]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@fbdev@info.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@fbdev@info.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208] / [i915#2575]) -> [PASS][176] +100 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][177] ([Intel XE#4543]) -> [PASS][178] +4 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][179] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][180] +1 other test pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-lnl:          [ABORT][181] -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][183] ([Intel XE#2291]) -> [PASS][184] +4 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][185] ([Intel XE#4294]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][187] ([Intel XE#2316]) -> [PASS][188] +7 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][189] ([Intel XE#886]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][191] ([Intel XE#1874]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][194] +10 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#4173]) -> [PASS][196] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][197] ([Intel XE#2571]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4208]) -> [PASS][200] +180 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1392]) -> [PASS][202] +4 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#2229]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@buffer-fill@rcs-0:
    - shard-lnl:          [FAIL][207] ([Intel XE#4565]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-3/igt@xe_oa@buffer-fill@rcs-0.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][209] ([Intel XE#1794]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#3768]) -> [SKIP][212] ([Intel XE#4208] / [i915#2575])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#316]) -> [SKIP][214] ([Intel XE#2351] / [Intel XE#4208])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-adlp:         [SKIP][215] ([Intel XE#1124]) -> [SKIP][216] ([Intel XE#4996])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#316]) -> [SKIP][218] ([Intel XE#4208]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][220] ([Intel XE#316]) +4 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-adlp:         [SKIP][221] ([Intel XE#316]) -> [SKIP][222] ([Intel XE#4996])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-adlp:         [SKIP][223] ([Intel XE#316]) -> [SKIP][224] ([Intel XE#2351] / [Intel XE#4996])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#4208]) -> [SKIP][226] ([Intel XE#316]) +1 other test skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#610]) -> [SKIP][228] ([Intel XE#4208])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#4208]) -> [SKIP][230] ([Intel XE#1124]) +4 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#1124]) -> [SKIP][234] ([Intel XE#4208]) +9 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][236] ([Intel XE#1124]) +3 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         [SKIP][237] ([Intel XE#619]) -> [SKIP][238] ([Intel XE#2351] / [Intel XE#4996])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][240] ([Intel XE#619]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#607]) -> [SKIP][242] ([Intel XE#4208])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#2191]) -> [SKIP][244] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         [SKIP][245] ([Intel XE#2191]) -> [SKIP][246] ([Intel XE#4996])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208] / [i915#2575]) -> [SKIP][248] ([Intel XE#2191])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208] / [i915#2575]) -> [SKIP][250] ([Intel XE#367]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#367]) -> [SKIP][252] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][254] ([Intel XE#2351] / [Intel XE#4208])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208]) -> [SKIP][256] ([Intel XE#2907])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
    - shard-adlp:         [SKIP][257] ([Intel XE#2907]) -> [SKIP][258] ([Intel XE#4996])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][260] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][261] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][262] ([Intel XE#4996])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][263] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][264] ([Intel XE#4947] / [Intel XE#4996])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#4208]) -> [INCOMPLETE][266] ([Intel XE#3862])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2907]) -> [SKIP][268] ([Intel XE#4208]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2351] / [Intel XE#4208]) -> [INCOMPLETE][270] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][272] ([Intel XE#4208]) +15 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#4208]) -> [SKIP][274] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-adlp:         [SKIP][275] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][276] ([Intel XE#2351] / [Intel XE#4996])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#306]) -> [SKIP][278] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-adlp:         [SKIP][279] ([Intel XE#373]) -> [SKIP][280] ([Intel XE#4996])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#373]) -> [SKIP][282] ([Intel XE#4208] / [i915#2575]) +14 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#4208] / [i915#2575]) -> [SKIP][284] ([Intel XE#373]) +11 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#307]) -> [SKIP][286] ([Intel XE#4208] / [i915#2575])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208] / [i915#2575]) -> [SKIP][288] ([Intel XE#307])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][289] ([Intel XE#1178]) -> [SKIP][290] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_content_protection@lic-type-0.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#455]) -> [SKIP][292] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_content_protection@lic-type-1.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][293] ([Intel XE#1178]) -> [SKIP][294] ([Intel XE#2341]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_content_protection@srm.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#4208] / [i915#2575]) -> [SKIP][296] ([Intel XE#308]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-adlp:         [SKIP][297] ([Intel XE#455]) -> [SKIP][298] ([Intel XE#4996])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#308]) -> [SKIP][300] ([Intel XE#4208] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208] / [i915#2575]) -> [SKIP][302] ([Intel XE#323]) +1 other test skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#323]) -> [SKIP][304] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#4208]) -> [SKIP][306] ([Intel XE#4354])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4356]) -> [SKIP][308] ([Intel XE#4208]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4422]) -> [SKIP][310] ([Intel XE#4208])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#4208]) -> [SKIP][312] ([Intel XE#4422]) +1 other test skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         [SKIP][313] ([Intel XE#4422]) -> [SKIP][314] ([Intel XE#4945] / [Intel XE#4996])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([Intel XE#776])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#701]) -> [SKIP][318] ([Intel XE#4208] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][319] ([Intel XE#2882]) -> [SKIP][320] ([Intel XE#2316])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         [SKIP][321] ([Intel XE#310]) -> [SKIP][322] ([Intel XE#4996]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][323] ([Intel XE#3321]) -> [SKIP][324] ([Intel XE#2316])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][325] ([Intel XE#2316]) -> [FAIL][326] ([Intel XE#3321])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-adlp:         [SKIP][327] ([Intel XE#310]) -> [SKIP][328] ([Intel XE#4950] / [Intel XE#4996])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip@2x-plain-flip-interruptible.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][329] ([Intel XE#301]) -> [SKIP][330] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][332] ([Intel XE#455])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#455]) -> [SKIP][334] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208]) -> [SKIP][336] ([Intel XE#455]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455]) -> [SKIP][338] ([Intel XE#4208]) +5 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#651]) +19 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][341] ([Intel XE#2311]) -> [SKIP][342] ([Intel XE#2312]) +19 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][343] ([Intel XE#656]) -> [SKIP][344] ([Intel XE#4947])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][345] ([Intel XE#2312]) -> [SKIP][346] ([Intel XE#2311]) +15 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#651]) -> [SKIP][348] ([Intel XE#4208]) +34 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][350] ([Intel XE#651]) +10 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][351] ([Intel XE#2312]) -> [SKIP][352] ([Intel XE#4141]) +6 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][353] ([Intel XE#4141]) -> [SKIP][354] ([Intel XE#2312]) +9 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][355] ([Intel XE#651]) -> [SKIP][356] ([Intel XE#4996])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#651]) -> [SKIP][358] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][359] ([Intel XE#2312]) -> [SKIP][360] ([Intel XE#2313]) +14 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#653]) -> [SKIP][362] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208]) -> [SKIP][364] ([Intel XE#653]) +24 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#653]) -> [SKIP][366] ([Intel XE#4208]) +39 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][368] ([Intel XE#653]) +5 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][369] ([Intel XE#2313]) -> [SKIP][370] ([Intel XE#2312]) +19 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#605]) -> [SKIP][372] ([Intel XE#4208] / [i915#2575])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4208] / [i915#2575]) -> [SKIP][374] ([Intel XE#455]) +3 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#4208]) -> [SKIP][376] ([Intel XE#346]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         [SKIP][377] ([Intel XE#2925]) -> [SKIP][378] ([Intel XE#4947])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#4208]) -> [SKIP][380] ([Intel XE#2925])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2925]) -> [SKIP][382] ([Intel XE#4208])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208]) -> [SKIP][384] ([Intel XE#4359])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#4208] / [i915#2575]) -> [SKIP][386] ([Intel XE#5021])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][387] ([Intel XE#4596]) -> [SKIP][388] ([Intel XE#5021])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#5020]) -> [SKIP][390] ([Intel XE#4208] / [i915#2575])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][392] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#4208] / [i915#2575]) -> [SKIP][394] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#870]) -> [SKIP][396] ([Intel XE#4208])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_pm_backlight@fade.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#4208]) -> [SKIP][398] ([Intel XE#3309])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-dg2-set2:     [FAIL][399] ([Intel XE#5017]) -> [SKIP][400] ([Intel XE#4208] / [i915#2575])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_properties@get_properties-sanity-non-atomic.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208]) -> [SKIP][402] ([Intel XE#1489]) +5 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1489]) -> [SKIP][404] ([Intel XE#4208]) +11 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         [SKIP][405] ([Intel XE#1489]) -> [SKIP][406] ([Intel XE#4947])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][408] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][410] ([Intel XE#4208]) +13 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#4208]) -> [SKIP][412] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][414] ([Intel XE#2351] / [Intel XE#4208]) +9 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_psr@psr-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-sprite-render:
    - shard-adlp:         [SKIP][415] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][416] ([Intel XE#4996])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr@psr-sprite-render.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#3414]) -> [SKIP][418] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208] / [i915#2575]) -> [SKIP][420] ([Intel XE#3414]) +2 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1127]) -> [SKIP][422] ([Intel XE#4208] / [i915#2575])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#4208] / [i915#2575]) -> [SKIP][424] ([Intel XE#1127])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#4208] / [i915#2575]) -> [FAIL][426] ([Intel XE#1729])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#4208] / [i915#2575]) -> [SKIP][428] ([Intel XE#1500])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2168]) -> [SKIP][430] ([Intel XE#4208] / [i915#2575])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_vrr@cmrr.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#4208] / [i915#2575]) -> [SKIP][432] ([Intel XE#2168])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_vrr@lobf.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#756]) -> [SKIP][434] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#4208] / [i915#2575]) -> [SKIP][436] ([Intel XE#1091] / [Intel XE#2849])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][437] ([Intel XE#2705]) -> [SKIP][438] ([Intel XE#4208])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@testdisplay.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@testdisplay.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         [SKIP][439] ([Intel XE#3576]) -> [SKIP][440] ([Intel XE#4945])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][442] ([Intel XE#4208]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#4208]) -> [SKIP][444] ([Intel XE#1123])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1123]) -> [SKIP][446] ([Intel XE#4208])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#1126]) -> [SKIP][448] ([Intel XE#4208])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#4208]) -> [SKIP][450] ([Intel XE#1126]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         [SKIP][451] ([Intel XE#4497]) -> [SKIP][452] ([Intel XE#4945])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_eu_stall@blocking-read.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_eu_stall@blocking-read.html
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#4208]) -> [SKIP][454] ([Intel XE#4497])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_eu_stall@blocking-read.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#4497]) -> [SKIP][456] ([Intel XE#4208])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_eu_stall@non-blocking-read.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#4208]) -> [SKIP][458] ([Intel XE#4837]) +16 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_eudebug@basic-close.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#4837]) -> [SKIP][460] ([Intel XE#4208]) +20 other tests skip
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         [SKIP][461] ([Intel XE#4837]) -> [SKIP][462] ([Intel XE#4945]) +3 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         [SKIP][463] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][464] ([Intel XE#4945])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_evict@evict-beng-small-external-cm.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#1392]) -> [SKIP][466] ([Intel XE#4208]) +2 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][467] ([Intel XE#1392]) -> [SKIP][468] ([Intel XE#4945])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#4208]) -> [SKIP][470] ([Intel XE#1392]) +5 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
    - shard-adlp:         [SKIP][471] ([Intel XE#288]) -> [SKIP][472] ([Intel XE#4945]) +5 other tests skip
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#4208]) -> [SKIP][474] ([Intel XE#288]) +28 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#288]) -> [SKIP][476] ([Intel XE#4208]) +40 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#2360]) -> [SKIP][478] ([Intel XE#4208])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@many-large-malloc-nomemset:
    - shard-dg2-set2:     [SKIP][479] ([Intel XE#4915]) -> [SKIP][480] ([Intel XE#4208]) +275 other tests skip
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-new:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#4208]) -> [SKIP][482] ([Intel XE#4915]) +184 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_system_allocator@process-many-stride-new.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_system_allocator@process-many-stride-new.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:
    - shard-adlp:         [SKIP][483] ([Intel XE#4915]) -> [SKIP][484] ([Intel XE#4945] / [Intel XE#4996]) +31 other tests skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#4208]) -> [INCOMPLETE][486] ([Intel XE#4911])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#4208]) -> [SKIP][488] ([Intel XE#255])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#4208]) -> [SKIP][490] ([Intel XE#512])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_mmap@small-bar.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@blocking:
    - shard-adlp:         [SKIP][491] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][492] ([Intel XE#4945]) +1 other test skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_oa@blocking.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_oa@blocking.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#4208]) -> [SKIP][494] ([Intel XE#4501])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@buffer-size.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_oa@buffer-size.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#4208]) -> [SKIP][496] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#4208]) -> [SKIP][498] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][500] ([Intel XE#4208]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][502] ([Intel XE#4208]) +8 other tests skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#4208]) -> [SKIP][504] ([Intel XE#1337])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#977]) -> [SKIP][506] ([Intel XE#4208])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_pat@pat-index-xe2.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#4208]) -> [SKIP][508] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][510] ([Intel XE#4208])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#579]) -> [SKIP][512] ([Intel XE#4208])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#4650]) -> [SKIP][514] ([Intel XE#4208])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_pmu@fn-engine-activity-load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#4733]) -> [SKIP][516] ([Intel XE#4208]) +3 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#4208]) -> [SKIP][518] ([Intel XE#4733]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#4208]) -> [SKIP][520] ([Intel XE#944]) +2 other tests skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_query@multigpu-query-engines.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][521] ([Intel XE#944]) -> [SKIP][522] ([Intel XE#4208]) +2 other tests skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-adlp:         [SKIP][523] ([Intel XE#944]) -> [SKIP][524] ([Intel XE#4945])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#4814]) -> [SKIP][526] ([Intel XE#4208])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#4130]) -> [SKIP][528] ([Intel XE#4208])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][529] ([Intel XE#4208]) -> [SKIP][530] ([Intel XE#4130]) +2 other tests skip
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#4208]) -> [SKIP][532] ([Intel XE#4351])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961 -> xe-pw-148912v2

  IGT_8364: 8364
  xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961
  xe-pw-148912v2: 148912v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/index.html

--===============1292076252933435728==
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
<tr><td><b>Series:</b></td><td>Track FAST_REQ H2Gs to report where errors came from (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148912/">https://patchwork.freedesktop.org/series/148912/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961_FULL -&gt; xe-pw-148912v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148912v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148912v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148912v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_plane_multiple@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_plane_multiple@tiling-none.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148912v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@fbdev@pan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +135 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_prop_blob@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_vrr@flip-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +302 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_exec_reset@cm-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_exec_system_allocator@many-execqueues-mmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_exec_system_allocator@many-large-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +72 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@xe_sriov_flr@flr-twice.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-3145728:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_vm@mixed-userptr-misaligned-binds-3145728.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +22 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@fbdev@info.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +100 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-4/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-2/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@many-null-rebind.html">PASS</a> +180 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-lnl-7/igt@xe_oa@buffer-fill@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4565">Intel XE#4565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-lnl-3/igt@xe_oa@buffer-fill@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-8/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_properties@get_properties-sanity-non-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017">Intel XE#5017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_properties@get_properties-sanity-non-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576">Intel XE#3576</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_eu_stall@non-blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_eu_stall@non-blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_eudebug_online@reset-with-attention.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_evict@evict-beng-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-malloc-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-434/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_exec_system_allocator@many-large-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +275 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_exec_system_allocator@process-many-stride-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_exec_system_allocator@process-many-stride-new.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@blocking:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_oa@blocking.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-adlp-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-432/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148912v2/shard-dg2-435/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961 -&gt; xe-pw-148912v2</li>
</ul>
<p>IGT_8364: 8364<br />
  xe-3088-dd6a856541dd90fa4ef755783898fcfbea3b9961: dd6a856541dd90fa4ef755783898fcfbea3b9961<br />
  xe-pw-148912v2: 148912v2</p>

</body>
</html>

--===============1292076252933435728==--
