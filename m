Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D845FC7115B
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 15:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8411810E0AB;
	Thu, 19 Jun 2025 15:29:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F2710E0AB;
 Thu, 19 Jun 2025 15:29:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3886308929090649401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_xe=5Flate=5Fbind?=
 =?utf-8?q?_squash_for_CI_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Jun 2025 15:29:05 -0000
Message-ID: <175034694507.96474.13595020304649755910@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250619023839.2934459-1-badal.nilawar@intel.com>
In-Reply-To: <20250619023839.2934459-1-badal.nilawar@intel.com>
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

--===============3886308929090649401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe_late_bind squash for CI (rev3)
URL   : https://patchwork.freedesktop.org/series/150059/
State : failure

== Summary ==

CI Bug Log - changes from xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58_FULL -> xe-pw-150059v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150059v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150059v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150059v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +48 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-4/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][6] -> [SKIP][7] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_exec_system_allocator@evict-malloc-mix-bo:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-8/igt@xe_exec_system_allocator@evict-malloc-mix-bo.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@xe_exec_system_allocator@evict-malloc-mix-bo.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userptr.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-dg2-set2:     [INCOMPLETE][12] ([Intel XE#4842]) -> [DMESG-WARN][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@core_hotunplug@hotreplug-lateclose.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][14] ([Intel XE#1178]) -> [DMESG-FAIL][15] +1 other test dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-2/igt@kms_content_protection@atomic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][16] ([Intel XE#2291]) -> [DMESG-WARN][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][18] ([Intel XE#2316]) -> [DMESG-WARN][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-render-node-load@engine-drm_xe_engine_class_compute0}:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] +1 other test dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-7/igt@xe_pmu@engine-activity-render-node-load@engine-drm_xe_engine_class_compute0.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-3/igt@xe_pmu@engine-activity-render-node-load@engine-drm_xe_engine_class_compute0.html

  
Known issues
------------

  Here are the changes found in xe-pw-150059v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#3767]) +15 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#316]) +5 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#316]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][26] ([Intel XE#4543])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124]) +16 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#619])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#610])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#2191]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#367]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#787]) +17 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +146 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2907]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#455] / [Intel XE#787]) +41 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#4416]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#306]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#373]) +13 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#307])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#1178]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#3304])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#308]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#2953] / [Intel XE#4173]) +14 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-1/igt@kms_cursor_crc@cursor-random-128x42.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-8/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#1475]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#1340])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4354])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#4354])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#4331])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#4422])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#701])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1135])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#310])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#2316]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_flip@2x-plain-flip.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][63] ([Intel XE#301]) +1 other test fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][64] -> [FAIL][65] ([Intel XE#301] / [Intel XE#3321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][66] -> [FAIL][67] ([Intel XE#301])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][68] -> [INCOMPLETE][69] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#886]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-1/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [PASS][72] -> [FAIL][73] ([Intel XE#886]) +3 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-1/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][74] -> [DMESG-FAIL][75] ([Intel XE#4543])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#651]) +46 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#656]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#651]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#653]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#653]) +45 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#1503])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_hdr@static-toggle.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#346])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][84] -> [SKIP][85] ([Intel XE#3012])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#4298])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2925])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#356])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#4359])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-bmg:          [PASS][90] -> [DMESG-WARN][91] ([Intel XE#5175])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_plane_multiple@tiling-none.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#2571])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#870])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1129]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1489]) +13 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1489]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1122])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929]) +21 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#3414])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#3414])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#455]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][104] ([Intel XE#1729])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1091] / [Intel XE#2849])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#455]) +22 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1123])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1126]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4837]) +17 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#4837])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#288]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#288]) +36 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#2360])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#4915]) +32 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#4915]) +377 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-dg2-set2:     [PASS][118] -> [DMESG-WARN][119] ([Intel XE#3876])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#255])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#378])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@force-load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][122] -> [DMESG-WARN][123] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5244])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-6/igt@xe_module_load@many-reload.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_module_load@many-reload.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2541] / [Intel XE#3573])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2838] / [Intel XE#979])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2284])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][130] -> [ABORT][131] ([Intel XE#1794])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_pm@s4-basic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][132] -> [ABORT][133] ([Intel XE#1794])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-3/igt@xe_pm@s4-vm-bind-prefetch.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#4650])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#4733]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#4733]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#944]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4814])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4814])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#4130]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#3342])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_wedged@basic-wedged:
    - shard-bmg:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#3858])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@xe_wedged@basic-wedged.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-adlp:         [SKIP][144] ([Intel XE#4963]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@core_hotunplug@hotreplug-lateclose.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][146] ([Intel XE#3908]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [SKIP][148] ([Intel XE#4947]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][150] ([Intel XE#4543]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][152] ([Intel XE#2291]) -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [SKIP][154] ([Intel XE#2316]) -> [PASS][155] +3 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         [FAIL][156] ([Intel XE#886]) -> [PASS][157] +1 other test pass
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-3/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:
    - shard-bmg:          [FAIL][158] ([Intel XE#2882]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_flip@plain-flip-ts-check@a-hdmi-a3.html

  * igt@kms_flip_event_leak@basic:
    - shard-adlp:         [SKIP][160] ([Intel XE#4950]) -> [PASS][161] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_flip_event_leak@basic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][162] ([Intel XE#1874]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][164] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][166] ([Intel XE#4459]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][168] ([Intel XE#5018]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_mmap@bad-flags:
    - shard-adlp:         [SKIP][170] ([Intel XE#4945]) -> [PASS][171] +14 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_mmap@bad-flags.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_mmap@bad-flags.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [SKIP][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190]) ([Intel XE#378]) -> ([PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][207] ([Intel XE#1794]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [FAIL][209] ([Intel XE#4835]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-6/igt@xe_pmu@gt-frequency.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-6/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][211] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][212] ([Intel XE#316])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][213] ([Intel XE#4947]) -> [SKIP][214] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][215] ([Intel XE#1178]) -> [SKIP][216] ([Intel XE#2341]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_content_protection@srm.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-adlp:         [SKIP][217] ([Intel XE#4950]) -> [SKIP][218] ([Intel XE#309])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-adlp:         [SKIP][219] ([Intel XE#4947]) -> [SKIP][220] ([Intel XE#4331])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][221] ([Intel XE#2316]) -> [DMESG-WARN][222] ([Intel XE#5208])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][223] ([Intel XE#4947]) -> [SKIP][224] ([Intel XE#651])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][225] ([Intel XE#2311]) -> [SKIP][226] ([Intel XE#2312]) +8 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][227] ([Intel XE#2312]) -> [SKIP][228] ([Intel XE#2311]) +9 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][229] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][230] ([Intel XE#656])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][231] ([Intel XE#4947]) -> [DMESG-WARN][232] ([Intel XE#2953] / [Intel XE#4173])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][233] ([Intel XE#2312]) -> [SKIP][234] ([Intel XE#4141]) +6 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][235] ([Intel XE#4141]) -> [SKIP][236] ([Intel XE#2312]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][237] ([Intel XE#2312]) -> [SKIP][238] ([Intel XE#2313]) +8 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][239] ([Intel XE#2313]) -> [SKIP][240] ([Intel XE#2312]) +9 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][241] ([Intel XE#4947]) -> [SKIP][242] ([Intel XE#656]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         [SKIP][243] ([Intel XE#4947]) -> [SKIP][244] ([Intel XE#1489]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         [SKIP][245] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][246] ([Intel XE#2850] / [Intel XE#929])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_psr@pr-sprite-plane-onoff.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-adlp:         [SKIP][247] ([Intel XE#4950]) -> [SKIP][248] ([Intel XE#455])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_vrr@seamless-rr-switch-virtual.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:
    - shard-adlp:         [SKIP][249] ([Intel XE#4945]) -> [SKIP][250] ([Intel XE#288]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         [SKIP][251] ([Intel XE#4945]) -> [SKIP][252] ([Intel XE#4915]) +20 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][253] ([Intel XE#4945]) -> [SKIP][254] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_oa@unprivileged-single-ctx-counters.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         [SKIP][255] ([Intel XE#4945]) -> [SKIP][256] ([Intel XE#944]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3858
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4835
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5175
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5244
  [Intel XE#5301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5301
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58 -> xe-pw-150059v3

  IGT_8418: 8418
  xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58: 0cd8ffca03164a8a9686dbab2a21fae671161e58
  xe-pw-150059v3: 150059v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/index.html

--===============3886308929090649401==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe_late_bind squash for CI (rev3)</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150059/">https://patchwork.freedesktop.org/series/150059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150059v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150059v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3274-0cd8ffca03164a8a9686dbab2a21fae67=
1161e58_FULL -&gt; xe-pw-150059v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150059v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150059v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1500=
59v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-chec=
k@ab-dp2-hdmi-a3.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-4/igt@kms_flip=
@absolute-wf_vblank-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@k=
ms_flip@absolute-wf_vblank-interruptible@a-hdmi-a3.html">DMESG-WARN</a> +48=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_pm_r=
pm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_pm_rpm@basic-rte.html">FAIL<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-7/igt@kms_pm_r=
pm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@kms_pm_rpm=
@modeset-non-lpsp-stress-no-wait.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc-mix-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-8/igt@xe_exec_=
system_allocator@evict-malloc-mix-bo.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@xe_exec_=
system_allocator@evict-malloc-mix-bo.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-userpt=
r.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@core_h=
otunplug@hotreplug-lateclose.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-43=
6/igt@core_hotunplug@hotreplug-lateclose.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-2/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-2/igt@kms_conte=
nt_protection@atomic.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_curs=
or_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/=
igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/igt@kms_flip=
@2x-wf_vblank-ts-check.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@engine-activity-render-node-load@engine-drm_xe_engine_class=
_compute0}:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-7/igt@xe_pmu@e=
ngine-activity-render-node-load@engine-drm_xe_engine_class_compute0.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0059v3/shard-bmg-3/igt@xe_pmu@engine-activity-render-node-load@engine-drm_x=
e_engine_class_compute0.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150059v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4=
-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767=
</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@4-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@y-tiled-8bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_bw@connected-linear-til=
ing-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_bw@linear-tiling-3-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +146 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_chamelium_frames@hdmi-c=
rc-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/373">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_content_protection@dp-m=
st-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-random-128x42.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-8/igt@kms_cursor_crc@=
cursor-random-128x42.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +14 o=
ther tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_dp_linktrain_fallback@d=
sc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_feature_discovery@psr2.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-=
nop-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_flip=
@2x-plain-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_flip@2x-plain-flip.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/231=
6">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_flip@flip-vs-expired-vb=
lank-interruptible@d-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-150059v3/shard-bmg-8/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-1/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-5/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-1/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-9/igt@kms_flip@wf_v=
blank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp=
-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +46 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +45 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_hdr@=
static-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503"=
>Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_joiner@basic-max-non-jo=
iner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4298">Intel XE#4298</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_joiner@switch-modeset-u=
ltra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_plan=
e_multiple@tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_plane_multiple@til=
ing-none.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5175">Intel XE#5175</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_pm_backlight@bad-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +13 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@kms_psr2_sf@pr-primary-plane=
-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-pla=
ne-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-plan=
e-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@kms_rotation_crc@primary-ro=
tation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@kms_setmode@invalid-clone-si=
ngle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_copy_basic@mem-copy-line=
ar-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_eudebug@basic-vm-access-=
userptr-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ext=
ended.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-=
userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +36 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_exec_system_allocator@thr=
eads-many-large-mmap-shared-remap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +32 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +377 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_exe=
c_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_exec_threa=
ds@threads-hang-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-6/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5244">Intel XE#5244</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-str=
eam-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-1/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_oa@syncs-syncobj-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2838">Intel XE#2838</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_pm@s=
4-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-150059v3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1=
794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-3/igt@xe_pm@s4=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150059v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pmu@fn-engine-activity-s=
ched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_pxp@pxp-stale-bo-bind-po=
st-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4733">Intel XE#4733</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_pxp@pxp-termination-key-u=
pdate-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4733">Intel XE#4733</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_render_copy@render-stress=
-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_sriov_auto_provisioning@=
exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150059v3/shard-bmg-4/igt@xe_wedged@basic-wedged.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3858">Intel XE#3858</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@core_ho=
tunplug@hotreplug-lateclose.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@co=
re_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-2/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150059v3/shard-adlp-3/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/=
shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-150059v3/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-7/i=
gt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +2 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@kms_fli=
p@plain-flip-ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-3/igt@kms_flip@p=
lain-flip-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_flip=
@plain-flip-ts-check@a-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-1/ig=
t@kms_flip@plain-flip-ts-check@a-hdmi-a3.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_fli=
p_event_leak@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_flip_ev=
ent_leak@basic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-2/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel X=
E#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150059v3/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-1/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-5/igt@kms_vrr@cmrr@=
pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018"=
>Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150059v3/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-=
vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-flags:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_mmap=
@bad-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@xe_mmap@bad-flags.h=
tml">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671=
161e58/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21=
fae671161e58/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686d=
bab2a21fae671161e58/shard-dg2-436/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8=
a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca0=
3164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd=
8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-435/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-32=
74-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-dg2-466=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-d=
g2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fae67116=
1e58/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3274-0cd8ffca03164a8a9686dbab2a21fa=
e671161e58/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15005=
9v3/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard=
-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150059v3/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shar=
d-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-466/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-150059v3/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-150059v3/shard-dg2-434/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-4/igt@xe_pm@s4-d=
3hot-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-lnl-6/igt@xe_pmu@g=
t-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4835">Intel XE#4835</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-lnl-6/igt@xe_pmu@gt-frequency=
.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_big=
_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard=
-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_ccs=
@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp=
-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_cur=
sor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-adlp-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-at=
omic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_dp_=
linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/i=
gt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-bmg-4/i=
gt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
059v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
7">Intel XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-prim=
scrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v=
3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0059v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50059v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150059v3/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_psr=
2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel X=
E#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-150059v3/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuou=
s-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_psr=
@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp=
-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@kms_vrr=
@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/igt@km=
s_vrr@seamless-rr-switch-virtual.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_exec=
_fault_mode@once-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1500=
59v3/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-prefe=
tch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_exec=
_system_allocator@once-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/=
shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_oa@u=
nprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6/i=
gt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#=
3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58/shard-adlp-8/igt@xe_quer=
y@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v3/shard-adlp-6=
/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +=
1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58 -&gt; xe-pw-150=
059v3</li>
</ul>
<p>IGT_8418: 8418<br />
  xe-3274-0cd8ffca03164a8a9686dbab2a21fae671161e58: 0cd8ffca03164a8a9686dba=
b2a21fae671161e58<br />
  xe-pw-150059v3: 150059v3</p>

</body>
</html>

--===============3886308929090649401==--
