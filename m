Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC2AC52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 12:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3727110E627;
	Fri, 23 Aug 2024 12:50:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9548E10E627;
 Fri, 23 Aug 2024 12:50:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0239966401583894247=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Use_dma-fence_array_f?=
 =?utf-8?q?or_media_GT_TLB_invalidations_in_PT_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 12:50:14 -0000
Message-ID: <172441741459.745445.2817781851697512398@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823024058.2061503-1-matthew.brost@intel.com>
In-Reply-To: <20240823024058.2061503-1-matthew.brost@intel.com>
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

--===============0239966401583894247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use dma-fence array for media GT TLB invalidations in PT code (rev2)
URL   : https://patchwork.freedesktop.org/series/137676/
State : failure

== Summary ==

CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full -> xe-pw-137676v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137676v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137676v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137676v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +4 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:
    - shard-lnl:          ([PASS][3], [PASS][4]) -> [ABORT][5] +18 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_pm@s3-mocs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - {shard-bmg}:        ([PASS][8], [PASS][9]) -> [ABORT][10] +20 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-4/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-8/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - {shard-bmg}:        [PASS][11] -> [ABORT][12] +3 other tests abort
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-4/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
Known issues
------------

  Here are the changes found in xe-pw-137676v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][13] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     ([PASS][14], [PASS][15]) -> [INCOMPLETE][16] ([Intel XE#1195])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([PASS][18], [PASS][19]) -> [FAIL][20] ([Intel XE#1231])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][21], [PASS][22]) -> [FAIL][23] ([Intel XE#1204]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#787]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#306])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#307])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1188]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-adlp:         ([PASS][36], [PASS][37]) -> [INCOMPLETE][38] ([Intel XE#1195]) +1 other test incomplete
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1137] / [Intel XE#1201])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         ([PASS][40], [PASS][41]) -> [FAIL][42] ([Intel XE#1874]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [i915#5274])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#651]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         ([PASS][45], [PASS][46]) -> [FAIL][47] ([Intel XE#1861]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#1861])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#658])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#653])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#616]) +3 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#2318]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#929])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#327])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         ([PASS][62], [PASS][63]) -> [FAIL][64] ([Intel XE#771] / [Intel XE#899])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         ([PASS][65], [PASS][66]) -> [FAIL][67] ([Intel XE#899])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][68] -> [DMESG-WARN][69] ([Intel XE#2019]) +5 other tests dmesg-warn
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-idle:
    - shard-adlp:         ([PASS][70], [PASS][71]) -> [SKIP][72] ([Intel XE#1201]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_vblank@wait-idle.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_vrr@flipline.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][74] ([Intel XE#1050])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1123])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][76] -> [TIMEOUT][77] ([Intel XE#1041] / [Intel XE#1473])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     ([PASS][78], [PASS][79]) -> [FAIL][80] ([Intel XE#1600])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][81] -> [INCOMPLETE][82] ([Intel XE#1195] / [Intel XE#1473])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][83] ([Intel XE#1473])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - shard-adlp:         ([PASS][84], [PASS][85]) -> [DMESG-WARN][86] ([Intel XE#2226]) +5 other tests dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#288])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     ([PASS][89], [PASS][90]) -> [TIMEOUT][91] ([Intel XE#2105])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_threads@threads-bal-basic:
    - shard-adlp:         [PASS][92] -> [DMESG-WARN][93] ([Intel XE#2226])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_exec_threads@threads-bal-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][94] -> [DMESG-WARN][95] ([Intel XE#1727] / [Intel XE#2226])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#1201] / [Intel XE#2229])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1201] / [Intel XE#977])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     ([PASS][99], [PASS][100]) -> [DMESG-WARN][101] ([Intel XE#1551] / [Intel XE#569])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][102] -> [DMESG-WARN][103] ([Intel XE#569])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [PASS][104] -> [ABORT][105] ([Intel XE#1358] / [Intel XE#1607])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          ([PASS][106], [PASS][107]) -> [ABORT][108] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm@s4-multiple-execs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#944])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         ([PASS][110], [PASS][111]) -> [FAIL][112] ([Intel XE#1081])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([DMESG-WARN][113], [PASS][114]) ([Intel XE#1033]) -> [PASS][115] +1 other test pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          ([FAIL][116], [PASS][117]) ([Intel XE#1701]) -> [PASS][118] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][119], [FAIL][120]) ([Intel XE#1426]) -> [PASS][121] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         ([FAIL][122], [DMESG-FAIL][123]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][124] +1 other test pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     ([PASS][125], [DMESG-WARN][126]) ([Intel XE#877]) -> [PASS][127] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         ([PASS][128], [FAIL][129]) ([Intel XE#1874]) -> [PASS][130] +2 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         ([FAIL][131], [FAIL][132]) ([Intel XE#1874]) -> [PASS][133] +12 other tests pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         ([FAIL][134], [FAIL][135]) ([Intel XE#1861]) -> [PASS][136]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][137] ([Intel XE#1861]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:
    - {shard-bmg}:        ([DMESG-WARN][139], [DMESG-WARN][140]) ([Intel XE#877]) -> [PASS][141] +1 other test pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [FAIL][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_pm_rpm@i2c.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][144] ([Intel XE#771] / [Intel XE#899]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#899]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - {shard-bmg}:        ([INCOMPLETE][148], [PASS][149]) ([Intel XE#1473]) -> [PASS][150]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-7/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][151] ([Intel XE#1473]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_evict@evict-beng-threads-large.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][153] ([Intel XE#1600]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][155] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-threads-large.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-7/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-adlp:         ([DMESG-FAIL][157], [DMESG-FAIL][158]) ([Intel XE#1638]) -> [PASS][159]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-rebind:
    - shard-adlp:         ([DMESG-WARN][160], [DMESG-WARN][161]) ([Intel XE#2226]) -> [PASS][162] +4 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-6/igt@xe_exec_basic@many-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     ([DMESG-WARN][165], [DMESG-WARN][166]) ([Intel XE#2019]) -> [PASS][167]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         ([ABORT][168], [PASS][169]) ([Intel XE#1794]) -> [PASS][170]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][171] ([Intel XE#2019]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         ([FAIL][173], [FAIL][174]) ([Intel XE#1081]) -> [PASS][175]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#873]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#873])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([SKIP][178], [SKIP][179]) ([Intel XE#1201]) -> [SKIP][180] ([Intel XE#1124] / [Intel XE#1201])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     ([SKIP][181], [SKIP][182]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][183] ([Intel XE#316]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#316]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#610]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#610])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][188] ([Intel XE#1242]) -> [DMESG-FAIL][189] ([Intel XE#324])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][191] ([Intel XE#1124]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1124]) -> [SKIP][193] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][195] ([Intel XE#607]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     ([SKIP][196], [SKIP][197]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][198] ([Intel XE#1124]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#367]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     ([SKIP][201], [SKIP][202]) ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][203] ([Intel XE#2191])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#2191]) -> [SKIP][205] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][207] ([Intel XE#367])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     ([SKIP][208], [SKIP][209]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][210] ([Intel XE#367])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#787]) -> [SKIP][212] ([Intel XE#1201] / [Intel XE#787]) +34 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][213] -> [SKIP][214] ([Intel XE#1201])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][218] ([Intel XE#787]) +6 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][220] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][221], [SKIP][222]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][223] ([Intel XE#787]) +55 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     ([SKIP][224], [SKIP][225]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][226] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#373]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#306]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#306])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     ([SKIP][231], [SKIP][232]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][233] ([Intel XE#373]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][235] ([Intel XE#373]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#307]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#307])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#308]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#308])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][241] ([Intel XE#308]) +1 other test skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][243] ([Intel XE#323])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#323]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#323])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     ([SKIP][246], [SKIP][247]) ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][248] ([Intel XE#323])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][249] ([i915#3804]) -> [SKIP][250] ([Intel XE#1201] / [i915#3804])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][252] ([Intel XE#455]) +6 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_dsc@dsc-with-bpc.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][254] ([Intel XE#776])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     ([SKIP][255], [SKIP][256]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][257] ([Intel XE#455]) +4 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         ([PASS][258], [FAIL][259]) ([Intel XE#1874]) -> [FAIL][260] ([Intel XE#1874]) +2 other tests fail
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][262] ([Intel XE#651]) +5 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         ([SKIP][263], [SKIP][264]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][265] ([Intel XE#1201])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         ([FAIL][266], [FAIL][267]) -> [SKIP][268] ([Intel XE#1201] / [Intel XE#651])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#651]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     ([SKIP][271], [SKIP][272]) ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][273] ([Intel XE#658])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][274] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][275] ([Intel XE#1201])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     ([SKIP][276], [SKIP][277]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][278] ([Intel XE#651]) +12 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][280] ([Intel XE#653]) +6 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     ([SKIP][281], [SKIP][282]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][283] ([Intel XE#653]) +12 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#653]) -> [SKIP][285] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         ([SKIP][286], [SKIP][287]) ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][288] ([Intel XE#1201]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#605]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#605])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     ([SKIP][291], [SKIP][292]) ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][293] ([Intel XE#417])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-adlp:         ([SKIP][294], [SKIP][295]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][296] ([Intel XE#1201])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     ([PASS][297], [DMESG-WARN][298]) ([Intel XE#1551]) -> [DMESG-WARN][299] ([Intel XE#1551]) +1 other test dmesg-warn
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][300], [SKIP][301]) ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][302] ([Intel XE#2318]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     ([SKIP][303], [SKIP][304]) ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][305] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][307] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][309] ([Intel XE#2318]) +2 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][311] ([Intel XE#870])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1129]) -> [SKIP][313] ([Intel XE#1129] / [Intel XE#1201]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1489]) -> [SKIP][315] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][317] ([Intel XE#929]) +4 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#929]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     ([SKIP][320], [SKIP][321]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][322] ([Intel XE#929]) +5 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr@psr-primary-render.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@psr-primary-render.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_psr@psr-primary-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-dg2-set2:     ([SKIP][323], [SKIP][324]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][325] ([Intel XE#327])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_rotation_crc@primary-rotation-90.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#1127]) -> [SKIP][327] ([Intel XE#1127] / [Intel XE#1201])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         ([SKIP][328], [SKIP][329]) ([Intel XE#1201]) -> [SKIP][330] ([Intel XE#1201] / [Intel XE#327])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#455]) -> [SKIP][332] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][333], [SKIP][334]) ([Intel XE#1201] / [Intel XE#1500] / [Intel XE#362]) -> [SKIP][335] ([Intel XE#1201] / [Intel XE#1500])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     ([SKIP][336], [SKIP][337]) ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][338] ([Intel XE#756])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#756]) -> [SKIP][340] ([Intel XE#1201] / [Intel XE#756])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     ([TIMEOUT][341], [TIMEOUT][342]) ([Intel XE#1473]) -> [INCOMPLETE][343] ([Intel XE#1473])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][344] ([Intel XE#1041] / [Intel XE#1473]) -> [INCOMPLETE][345] ([Intel XE#1195] / [Intel XE#1473])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][347] ([Intel XE#288]) +5 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#288]) -> [SKIP][349] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     ([SKIP][350], [SKIP][351]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][352] ([Intel XE#288]) +8 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#512]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#512])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mmap@small-bar.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_mmap@small-bar.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2541]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     ([SKIP][357], [SKIP][358]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][359] ([Intel XE#2541]) +4 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1337]) -> [SKIP][361] ([Intel XE#1201] / [Intel XE#1337])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     ([SKIP][362], [SKIP][363]) ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][364] ([Intel XE#2284] / [Intel XE#366])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][366] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     ([SKIP][367], [SKIP][368]) ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][369] ([Intel XE#2284])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@d3cold-mocs.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@d3cold-mocs.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     ([DMESG-WARN][370], [DMESG-WARN][371]) ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569]) -> [DMESG-WARN][372] ([Intel XE#1162] / [Intel XE#569])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#579]) -> [SKIP][374] ([Intel XE#1201] / [Intel XE#579])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     ([SKIP][375], [SKIP][376]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][377] ([Intel XE#944])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#944]) -> [SKIP][379] ([Intel XE#1201] / [Intel XE#944])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][381] ([Intel XE#944]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][382] ([Intel XE#1760]) -> [DMESG-FAIL][383] ([Intel XE#1760])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_wedged@wedged-at-any-timeout.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7986 -> IGT_7987
  * Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -> xe-pw-137676v2

  IGT_7986: 7986
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70
  xe-pw-137676v2: 137676v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/index.html

--===============0239966401583894247==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use dma-fence array for media GT TLB=
 invalidations in PT code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/137676/">https://patchwork.freedesktop.org/series/137676/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-137676v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137676v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70_full -&gt; xe-pw-137676v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137676v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-137676v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1376=
76v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676=
v2/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr=
-invalidate-imm.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_exec=
_threads@threads-shared-vm-userptr-invalidate.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359=
e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-userptr-inv=
alidate.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137676v2/shard-lnl-7/igt@xe_exec_threads@threads-shared-vm-us=
erptr-invalidate.html">ABORT</a> +18 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@=
s3-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_pm@s3-mocs.html">DMESG-WARN</a><=
/li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-4/igt@xe_exec=
_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-bmg-2/igt@xe_exec_fault_mode@twice-bindexecqueue-=
userptr-invalidate.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-8/igt@xe_exec_fault_mode@twice-=
bindexecqueue-userptr-invalidate.html">ABORT</a> +20 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@xe_vm@mu=
nmap-style-unbind-userptr-inval-front.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-4/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-front.html">ABORT</a> +3 other tests abort=
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137676v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_atomic_transition@plane=
-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 =
other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_b=
ig_fb@x-tiled-64bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/s=
hard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-d=
g2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#119=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-6/igt@kms_big_fb@x-tiled-ma=
x-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee=
0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-strid=
e-32bpp-rotate-0-hflip-async-flip.html">PASS</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_big_f=
b@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#=
1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-=
yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-=
for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_content_protection@dp-m=
st-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cu=
rsor_edge_walk@128x128-top-edge.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/=
shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard=
-adlp-9/igt@kms_cursor_edge_walk@128x128-top-edge.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#=
1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_feature_discovery@dp-ms=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pip=
e-c-hdmi-a-1-y-to-x.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_tiling@flip-ch=
ange-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_force_connector_basic@p=
rune-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_fr=
ontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb=
65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offs=
cren-pri-shrfb-draw-blt.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@kms_frontbuffer_tra=
cking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp=
-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">=
Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#=
2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#=
2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-up=
date-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_psr@pr-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_un=
iversal_plane@cursor-fb-leak.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-=
4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e=
5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdm=
i-a-1.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137676v2/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pi=
pe-b-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vb=
lank@ts-continuation-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_vblank@ts-=
continuation-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +5 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vb=
lank@wait-idle.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@=
kms_vblank@wait-idle.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_vblank@wait-idle.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">=
Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_compute@ccs-mode-basic.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_copy_basic@mem-copy-line=
ar-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evi=
ct@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@evi=
ct-beng-cm-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ev=
ict@evict-beng-large-multi-vm-cm.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sha=
rd-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#160=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evi=
ct@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@=
evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_evict@evict-mixed-thread=
s-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exe=
c_balancer@once-cm-virtual-userptr-invalidate.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359=
e5774a8efbd70/shard-adlp-1/igt@xe_exec_balancer@once-cm-virtual-userptr-inv=
alidate.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_exec_balancer@once-cm-virtual-us=
erptr-invalidate.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +5 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_fault_mode@once-bas=
ic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bi=
ndexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ex=
ec_reset@parallel-gt-reset.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard=
-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/=
igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec=
_threads@threads-bal-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_exec_threads@t=
hreads-bal-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_f=
req@freq_fixed_exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_gt_freq@freq_fixed_ex=
ec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm=
@s3-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435=
/igt@xe_pm@s3-multiple-execs.html">PASS</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@xe_pm@s3-mult=
iple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@=
s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefet=
ch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s=
4-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137676v2/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm@s=
4-multiple-execs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt=
@xe_pm@s4-multiple-execs.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-2/igt@xe_pm@s4-multiple-e=
xecs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe_query@multigpu-query-inv=
alid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spi=
n_batch@spin-fixed-duration.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shar=
d-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/=
igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_as=
ync_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d6=
72ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-f=
lip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sh=
ard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi=
-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_ato=
mic_transition@modeset-transition-nonblocking.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359=
e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonb=
locking.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1701">Intel XE#1701</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137676v2/shard-lnl-3/igt@kms_atomic_transition@=
modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:<=
/p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_a=
tomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab3=
8ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane=
-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-=
dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-=
a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel X=
E#324</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-137676v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-18=
0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_c=
ursor_legacy@torture-move@pipe-b.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">In=
tel XE#877</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-137676v2/shard-dg2-434/igt@kms_cursor_legacy@torture-move@pipe-b.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pip=
e-c-hdmi-a-1-x-to-x.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_=
tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +2 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pip=
e-d-hdmi-a-1-y-to-y.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_=
tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +12 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_fr=
ontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0=
eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-=
offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/i=
gt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip=
-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-3:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_pla=
ne@pixel-format-source-clamping@pipe-b-plane-3.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping=
@pipe-b-plane-3.html">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg-2/igt@kms_plane@=
pixel-format-source-clamping@pipe-b-plane-3.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm=
_rpm@i2c.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_un=
iversal_plane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg=
2-433/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_un=
iversal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg=
2-433/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evic=
t@evict-beng-cm-threads-large.html">INCOMPLETE</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efb=
d70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel X=
E#1473</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-137676v2/shard-bmg-7/igt@xe_evict@evict-beng-cm-threads-large.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_evi=
ct@evict-beng-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/=
igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_evi=
ct@evict-large-multi-vm-cm.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@xe=
_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict=
@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-bmg=
-7/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exe=
c_balancer@many-parallel-userptr-invalidate.html">DMESG-FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr=
-invalidate.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-6/igt@xe_exec_bal=
ancer@many-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exe=
c_basic@many-rebind.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-=
adlp-1/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a>) (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sha=
rd-adlp-6/igt@xe_exec_basic@many-rebind.html">PASS</a> +4 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_liv=
e_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@x=
e_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mo=
dule_load@reload-no-display.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd7=
0/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel=
 XE#2019</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137676v2/shard-dg2-466/igt@xe_module_load@reload-no-display.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@=
s4-mocs.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@=
s4-mocs.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@xe_pm@s4-mocs.html">P=
ASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@=
s4-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pm=
@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spi=
n_batch@spin-fixed-duration-with-preempter.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e57=
74a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempte=
r.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1081">Intel XE#1081</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@xe_spin_batch@spin-fixed-du=
ration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@km=
s_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb6=
5fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bp=
p-rotate-0-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-1/igt@kms_big=
_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_b=
ig_fb@linear-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">=
Intel XE#316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-137676v2/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
6">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@km=
s_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#=
610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel=
 XE#1242</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-137676v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate=
-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sh=
ard-dg2-432/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/=
igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#60=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_b=
ig_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38=
ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#120=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
676v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hf=
lip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sh=
ard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/12=
01">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_b=
w@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd3=
59e5774a8efbd70/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays=
-1920x1080p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@km=
s_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/=
shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_bw=
@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676=
v2/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">In=
tel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_b=
w@linear-tiling-4-displays-2160x1440p.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8e=
fbd70/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/367">Intel XE#367</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_bw@linear-tiling-4-d=
isplays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676=
v2/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-=
a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cc=
s@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@kms_ccs@b=
ad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">I=
ntel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-137676v2/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-r=
c-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-18=
0-4-tiled-mtl-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-primary=
-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_c=
cs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672=
ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-137676v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_c=
cs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8e=
fbd70/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_ccs@rand=
om-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_cham=
elium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ch=
amelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@k=
ms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_c=
hamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_chamelium_hpd@hd=
mi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/=
igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel X=
E#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/=
igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13767=
6v2/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308"=
>Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Int=
el XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-137676v2/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cu=
rsor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137=
676v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-var=
ying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_c=
ursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-181=
7-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_leg=
acy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201=
">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_cursor_legacy@short-b=
usy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#32=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shar=
d-dg2-435/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ds=
c@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@km=
s_dsc@dsc-with-bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/=
igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_f=
lip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mod=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1=
817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_flip_sca=
led_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html"=
>SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_flip_scaled_crc@f=
lip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65=
fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pip=
e-b-hdmi-a-1-y-to-y.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-2/igt@kms_flip_=
tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a=
>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
1">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offs=
cren-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eab=
b65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-pr=
imscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-ad=
lp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0e=
abb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-=
primscrn-spr-indfb-fullscreen.html">FAIL</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-adlp-8/igt@kms_frontbuff=
er_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">=
Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt=
@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@fbc-tiling-y.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70=
/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/658">Intel XE#658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tilin=
g-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
651">Intel XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137676v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-=
primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab=
38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
37676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-=
indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
653">Intel XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-=
scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_f=
rontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee=
0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1=
p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/=
shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-m=
map-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0=
eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/sh=
ard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/igt@kms_getfb@=
getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_h=
dmi_inject@inject-audio.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg=
2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hd=
r@static-toggle-suspend.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-ad=
lp-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_p=
lane@plane-panning-bottom-right-suspend.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a=
8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html=
">DMESG-WARN</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1551">Intel XE#1551</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_plane@plane-panning-bo=
ttom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7=
365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_p=
lane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.htm=
l">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7=
365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Inte=
l XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2318">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling=
@planes-unity-scaling-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel=
 XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
18">Intel XE#2318</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@plane=
s-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-=
hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_plane_scaling@p=
lanes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel X=
E#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2=
-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ps=
r2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg=
2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1=
201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ps=
r@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@k=
ms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@kms_p=
sr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_p=
sr@psr-primary-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-=
463/igt@kms_psr@psr-primary-render.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676=
v2/shard-dg2-432/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_r=
otation_crc@primary-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/=
shard-dg2-466/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#=
1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
27">Intel XE#327</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_rotation_crc@primary-rotation-90=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-=
dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel =
XE#1127</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sh=
ard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel X=
E#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_sc=
aling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@k=
ms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_t=
iled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd35=
9e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-=
chamelium.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-=
436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel=
 XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_w=
riteback@writeback-invalid-parameters.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8e=
fbd70/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/120=
1">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@kms_writeback@writeback-=
invalid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_wr=
iteback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt=
@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_ev=
ict@evict-cm-threads-large.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sh=
ard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-dg2-432/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Inte=
l XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evi=
ct@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1376=
76v2/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
95">Intel XE#1195</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exe=
c_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Int=
el XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/288">Intel XE#288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_fault_mode@many-execqu=
eues-bindexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exe=
c_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg=
2-436/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE=
#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_ex=
ec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5=
774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-r=
ace.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_exec_faul=
t_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@=
invalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@xe_oa@in=
valid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa=
@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efb=
d70/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">I=
ntel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2541">Intel XE#2541</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-st=
ream-sample-oa.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-433/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm=
@d3cold-basic-exec.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466=
/igt@xe_pm@d3cold-basic-exec.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE=
#366</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
137676v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">=
Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-463/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm=
@d3cold-mocs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@x=
e_pm@d3cold-mocs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/=
igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm=
@s3-vm-bind-unbind-all.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/sha=
rd-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941"=
>Intel XE#1941</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/569">Intel XE#569</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137676v2/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-al=
l.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1162">Intel XE#1162</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-435/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_qu=
ery@multigpu-query-invalid-cs-cycles.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8ef=
bd70/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201"=
>Intel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-137676v2/shard-dg2-432/igt@xe_query@multigpu-query-in=
valid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_que=
ry@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard=
-dg2-433/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">In=
tel XE#1201</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676=
v2/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Int=
el XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_wed=
ged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137676v2/shard-dg2-466/=
igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7986 -&gt; IGT_7987</li>
<li>Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -&gt; xe-pw-137=
676v2</li>
</ul>
<p>IGT_7986: 7986<br />
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fc=
d359e5774a8efbd70<br />
  xe-pw-137676v2: 137676v2</p>

</body>
</html>

--===============0239966401583894247==--
