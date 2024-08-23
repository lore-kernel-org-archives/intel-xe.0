Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD2C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 13:32:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998AC10E02E;
	Fri, 23 Aug 2024 13:32:42 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272CA10E02E;
 Fri, 23 Aug 2024 13:32:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2511806626102432739=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Replace_dma-fence_chain_with_dm?=
 =?utf-8?q?a-fence_array_for_media_GT_TLB_invalidation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Aug 2024 13:32:41 -0000
Message-ID: <172441996114.746160.6475637041563097660@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240823045443.2132118-1-matthew.brost@intel.com>
In-Reply-To: <20240823045443.2132118-1-matthew.brost@intel.com>
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

--===============2511806626102432739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Replace dma-fence chain with dma-fence array for media GT TLB invalidation
URL   : https://patchwork.freedesktop.org/series/137684/
State : failure

== Summary ==

CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full -> xe-pw-137684v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137684v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137684v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137684v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_pm@s3-mocs:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_pm@s3-mocs.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance:
    - shard-lnl:          ([PASS][5], [PASS][6]) -> [TIMEOUT][7]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     ([SKIP][8], [SKIP][9]) ([Intel XE#1201]) -> [SKIP][10]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - {shard-bmg}:        ([PASS][11], [PASS][12]) -> [FAIL][13]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-137684v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#911]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         ([PASS][16], [PASS][17]) -> [DMESG-WARN][18] ([Intel XE#1033])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         ([PASS][19], [PASS][20]) -> [FAIL][21] ([Intel XE#1426]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1426]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          ([PASS][24], [PASS][25]) -> [FAIL][26] ([Intel XE#1426]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          ([PASS][27], [PASS][28]) -> [FAIL][29] ([Intel XE#1659]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([PASS][31], [PASS][32]) -> [FAIL][33] ([Intel XE#1231])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         ([PASS][34], [PASS][35]) -> [FAIL][36] ([Intel XE#1204]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1124]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#307])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#1188]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#308])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#308])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_edge_walk@128x128-top-edge:
    - shard-adlp:         ([PASS][49], [PASS][50]) -> [INCOMPLETE][51] ([Intel XE#1195]) +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_cursor_edge_walk@128x128-top-edge.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1137])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          ([PASS][53], [PASS][54]) -> [FAIL][55] ([Intel XE#886]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [i915#5274])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         ([PASS][57], [PASS][58]) -> [FAIL][59] ([Intel XE#1861]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [PASS][60] -> [FAIL][61] ([Intel XE#1861])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#658])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#653]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-3:
    - shard-lnl:          ([PASS][66], [PASS][67]) -> [DMESG-WARN][68] ([Intel XE#324]) +3 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#616]) +3 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2318]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_psr2_sf@cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1122] / [Intel XE#1201]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#929]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#327])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#455]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         ([PASS][78], [PASS][79]) -> [FAIL][80] ([Intel XE#771] / [Intel XE#899])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-lnl:          ([PASS][81], [PASS][82]) -> [FAIL][83] ([Intel XE#899]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         ([PASS][84], [PASS][85]) -> [FAIL][86] ([Intel XE#899])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][87] -> [DMESG-WARN][88] ([Intel XE#2019]) +5 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@wait-idle:
    - shard-adlp:         ([PASS][89], [PASS][90]) -> [SKIP][91] ([Intel XE#1201]) +4 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_vblank@wait-idle.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][93] ([Intel XE#1050])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1123] / [Intel XE#1201])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][95] -> [TIMEOUT][96] ([Intel XE#1473])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     ([PASS][97], [PASS][98]) -> [FAIL][99] ([Intel XE#1600])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1473])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][102] ([Intel XE#1473])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:
    - shard-adlp:         ([PASS][103], [PASS][104]) -> [DMESG-WARN][105] ([Intel XE#2226]) +5 other tests dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          ([PASS][106], [PASS][107]) -> [FAIL][108] ([Intel XE#1069])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#288])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-basic:
    - shard-adlp:         [PASS][111] -> [DMESG-WARN][112] ([Intel XE#2226])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][113] -> [DMESG-WARN][114] ([Intel XE#1727] / [Intel XE#2226])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#2229])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-lnl:          ([PASS][117], [PASS][118]) -> [FAIL][119] ([Intel XE#2249])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2249])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          ([PASS][122], [PASS][123]) -> [FAIL][124] ([Intel XE#2514])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - shard-lnl:          [PASS][125] -> [FAIL][126] ([Intel XE#2514])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#977])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     ([PASS][128], [PASS][129]) -> [DMESG-WARN][130] ([Intel XE#1551] / [Intel XE#569])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][131] -> [DMESG-WARN][132] ([Intel XE#569])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         ([PASS][135], [PASS][136]) -> [ABORT][137] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-lnl:          ([PASS][138], [PASS][139]) -> [TIMEOUT][140] ([Intel XE#2484])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1201] / [Intel XE#944])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         ([PASS][142], [PASS][143]) -> [FAIL][144] ([Intel XE#1081])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     ([PASS][145], [PASS][146]) -> [DMESG-FAIL][147] ([Intel XE#1760])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html
    - shard-adlp:         ([PASS][148], [PASS][149]) -> [ABORT][150] ([Intel XE#2310])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         ([DMESG-WARN][151], [PASS][152]) ([Intel XE#1033]) -> [PASS][153] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          ([FAIL][154], [PASS][155]) ([Intel XE#1701]) -> [PASS][156] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          ([FAIL][157], [FAIL][158]) ([Intel XE#1426]) -> [PASS][159] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        ([FAIL][160], [PASS][161]) ([Intel XE#1426]) -> [PASS][162] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([PASS][163], [FAIL][164]) ([Intel XE#1426]) -> [PASS][165] +1 other test pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - {shard-bmg}:        ([INCOMPLETE][166], [PASS][167]) -> [PASS][168]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          ([FAIL][169], [FAIL][170]) ([Intel XE#1659]) -> [PASS][171]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         ([FAIL][172], [FAIL][173]) ([Intel XE#1874]) -> [PASS][174] +10 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         ([FAIL][175], [DMESG-FAIL][176]) ([Intel XE#1231] / [Intel XE#324]) -> [PASS][177] +1 other test pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - {shard-bmg}:        ([FAIL][178], [PASS][179]) ([Intel XE#2436]) -> [PASS][180]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     ([PASS][181], [DMESG-WARN][182]) ([Intel XE#877]) -> [PASS][183] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:
    - {shard-bmg}:        ([DMESG-WARN][184], [PASS][185]) ([Intel XE#877]) -> [PASS][186] +4 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - {shard-bmg}:        ([DMESG-WARN][187], [DMESG-WARN][188]) ([Intel XE#877]) -> [PASS][189] +2 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][190] ([Intel XE#877]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          ([FAIL][192], [PASS][193]) ([Intel XE#886]) -> [PASS][194] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         ([PASS][195], [FAIL][196]) ([Intel XE#1874]) -> [PASS][197] +2 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         ([FAIL][198], [FAIL][199]) ([Intel XE#1861]) -> [PASS][200]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][201] ([Intel XE#1861]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        ([PASS][203], [SKIP][204]) ([Intel XE#1503]) -> [PASS][205]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-1:
    - shard-lnl:          ([DMESG-WARN][206], [PASS][207]) ([Intel XE#324]) -> [PASS][208] +2 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          ([DMESG-FAIL][209], [DMESG-FAIL][210]) ([Intel XE#324]) -> [PASS][211]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          ([DMESG-FAIL][212], [PASS][213]) ([Intel XE#324]) -> [PASS][214] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     ([FAIL][215], [FAIL][216]) ([Intel XE#361]) -> [PASS][217] +2 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:
    - {shard-bmg}:        [INCOMPLETE][218] -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [FAIL][220] -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_pm_rpm@i2c.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [FAIL][222] ([Intel XE#771] / [Intel XE#899]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#899]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          ([FAIL][226], [FAIL][227]) ([Intel XE#2443]) -> [PASS][228] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr@max-min.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr@max-min.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - {shard-bmg}:        ([INCOMPLETE][229], [PASS][230]) ([Intel XE#1473]) -> [PASS][231]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - {shard-bmg}:        ([FAIL][232], [FAIL][233]) ([Intel XE#2364]) -> [PASS][234]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        ([TIMEOUT][235], [TIMEOUT][236]) ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][237]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     [TIMEOUT][238] ([Intel XE#1473]) -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][240] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-adlp:         ([DMESG-FAIL][242], [DMESG-FAIL][243]) ([Intel XE#1638]) -> [PASS][244]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@many-rebind:
    - shard-adlp:         ([DMESG-WARN][245], [DMESG-WARN][246]) ([Intel XE#2226]) -> [PASS][247] +4 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@xe_exec_basic@many-rebind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-lnl:          ([PASS][250], [ABORT][251]) ([Intel XE#2317]) -> [PASS][252]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_module_load@reload.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_module_load@reload.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-5/igt@xe_module_load@reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     ([DMESG-WARN][253], [DMESG-WARN][254]) ([Intel XE#2019]) -> [PASS][255]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          ([PASS][256], [ABORT][257]) ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][258]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         ([ABORT][259], [PASS][260]) ([Intel XE#1794]) -> [PASS][261]
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][262] ([Intel XE#2019]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          ([PASS][264], [ABORT][265]) ([Intel XE#1794]) -> [PASS][266]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         ([FAIL][267], [FAIL][268]) ([Intel XE#1081]) -> [PASS][269]
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#801]) -> [SKIP][271] ([Intel XE#1201] / [Intel XE#801]) +23 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#873]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#873])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         ([SKIP][274], [SKIP][275]) ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1124] / [Intel XE#1201])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][278] ([Intel XE#316]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#316]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     ([SKIP][281], [SKIP][282]) ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][283] ([Intel XE#316]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         ([FAIL][284], [FAIL][285]) ([Intel XE#1231]) -> [DMESG-FAIL][286] ([Intel XE#324]) +1 other test dmesg-fail
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][288] ([Intel XE#607])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#610]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#610])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     ([SKIP][291], [SKIP][292]) ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][293] ([Intel XE#1124]) +3 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][295] ([Intel XE#1124])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][296] ([Intel XE#1242]) -> [FAIL][297] ([Intel XE#1231])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#1124]) -> [SKIP][299] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#2191]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#2191]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#367]) -> [SKIP][303] ([Intel XE#1201] / [Intel XE#367])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     ([SKIP][304], [SKIP][305]) ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][306] ([Intel XE#367]) +2 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#787]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][309] -> [SKIP][310] ([Intel XE#1201])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][312] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][314] ([Intel XE#787]) +34 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     ([SKIP][315], [SKIP][316]) ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][317] ([Intel XE#787]) +34 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][319] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     ([SKIP][320], [SKIP][321]) ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][322] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#373]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][326] ([Intel XE#306])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     ([SKIP][327], [SKIP][328]) ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][329] ([Intel XE#306])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#306]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#306])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][333] ([Intel XE#373])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     ([SKIP][334], [SKIP][335]) ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][336] ([Intel XE#373]) +5 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#307]) -> [SKIP][338] ([Intel XE#1201] / [Intel XE#307])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][340] ([Intel XE#455]) +10 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     ([SKIP][341], [SKIP][342]) ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][343] ([Intel XE#308])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#308]) -> [SKIP][345] ([Intel XE#1201] / [Intel XE#308])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-dg2-set2:     ([SKIP][346], [SKIP][347]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][348] ([Intel XE#455]) +6 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][350] ([Intel XE#308])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][352] ([Intel XE#323])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#323]) -> [SKIP][354] ([Intel XE#1201] / [Intel XE#323])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     ([SKIP][355], [SKIP][356]) ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][357] ([Intel XE#323])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][359] ([Intel XE#307])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][360] ([i915#3804]) -> [SKIP][361] ([Intel XE#1201] / [i915#3804])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][363] ([Intel XE#776])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     ([SKIP][364], [SKIP][365]) ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][366] ([Intel XE#701])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@chamelium.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         ([PASS][367], [FAIL][368]) ([Intel XE#1874]) -> [FAIL][369] ([Intel XE#1874]) +2 other tests fail
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         ([SKIP][370], [SKIP][371]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][372] ([Intel XE#1201])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         ([FAIL][373], [FAIL][374]) -> [SKIP][375] ([Intel XE#1201] / [Intel XE#651])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     ([SKIP][376], [SKIP][377]) ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][378] ([Intel XE#651]) +17 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][380] ([Intel XE#651]) +10 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#651]) -> [SKIP][382] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][383] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][384] ([Intel XE#1201])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][386] ([Intel XE#653]) +7 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#653]) -> [SKIP][388] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         ([SKIP][389], [SKIP][390]) ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][391] ([Intel XE#1201]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     ([SKIP][392], [SKIP][393]) ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][394] ([Intel XE#653]) +10 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     ([SKIP][395], [SKIP][396]) ([Intel XE#1201] / [Intel XE#417]) -> [SKIP][397] ([Intel XE#417])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-adlp:         ([SKIP][398], [SKIP][399]) ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][400] ([Intel XE#1201])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     ([PASS][401], [DMESG-WARN][402]) ([Intel XE#1551]) -> [DMESG-WARN][403] ([Intel XE#1551]) +1 other test dmesg-warn
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          ([DMESG-WARN][404], [PASS][405]) ([Intel XE#324]) -> [DMESG-WARN][406] ([Intel XE#324])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][408] ([Intel XE#2318]) +2 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][410] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1129]) -> [SKIP][412] ([Intel XE#1129] / [Intel XE#1201]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          ([PASS][413], [FAIL][414]) ([Intel XE#1430]) -> [FAIL][415] ([Intel XE#1430])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     ([SKIP][416], [SKIP][417]) ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][418] ([Intel XE#908])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1489]) -> [SKIP][420] ([Intel XE#1201] / [Intel XE#1489]) +4 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][422] ([Intel XE#1489])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     ([SKIP][423], [SKIP][424]) ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][425] ([Intel XE#1489]) +1 other test skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     ([SKIP][426], [SKIP][427]) ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][428] ([Intel XE#929]) +7 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][430] ([Intel XE#929]) +2 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#929]) -> [SKIP][432] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-dg2-set2:     ([SKIP][433], [SKIP][434]) ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][435] ([Intel XE#1149])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     ([SKIP][436], [SKIP][437]) ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][438] ([Intel XE#327]) +1 other test skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     ([SKIP][439], [SKIP][440]) ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][441] ([Intel XE#1127])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         ([SKIP][442], [SKIP][443]) ([Intel XE#1201]) -> [SKIP][444] ([Intel XE#1201] / [Intel XE#327])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#455]) -> [SKIP][446] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][447] ([Intel XE#1729]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#362])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     ([SKIP][449], [SKIP][450]) ([Intel XE#1201] / [Intel XE#1500] / [Intel XE#362]) -> [SKIP][451] ([Intel XE#1201] / [Intel XE#1500])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#756]) -> [SKIP][453] ([Intel XE#1201] / [Intel XE#756])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     ([SKIP][454], [SKIP][455]) ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][456] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#1126]) -> [SKIP][458] ([Intel XE#1126] / [Intel XE#1201])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     ([TIMEOUT][459], [TIMEOUT][460]) ([Intel XE#1473]) -> [INCOMPLETE][461] ([Intel XE#1195] / [Intel XE#1473])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][462] ([Intel XE#1041] / [Intel XE#1473]) -> [INCOMPLETE][463] ([Intel XE#1195] / [Intel XE#1473])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][465] ([Intel XE#288]) +5 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#288]) -> [SKIP][467] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     ([SKIP][468], [SKIP][469]) ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][470] ([Intel XE#288]) +14 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     ([SKIP][471], [SKIP][472]) ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][473] ([Intel XE#2360])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][475] ([Intel XE#2360])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#512]) -> [SKIP][477] ([Intel XE#1201] / [Intel XE#512])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mmap@small-bar.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([SKIP][478], [SKIP][479]) ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][480] ([Intel XE#378])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_module_load@load.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2541]) -> [SKIP][482] ([Intel XE#1201] / [Intel XE#2541]) +4 other tests skip
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][484] ([Intel XE#2541]) +1 other test skip
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     ([SKIP][485], [SKIP][486]) ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][487] ([Intel XE#2541]) +2 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1337]) -> [SKIP][489] ([Intel XE#1201] / [Intel XE#1337])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][491] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     ([SKIP][492], [SKIP][493]) ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][494] ([Intel XE#2284] / [Intel XE#366])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     ([DMESG-WARN][495], [DMESG-WARN][496]) ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569]) -> [DMESG-WARN][497] ([Intel XE#1162] / [Intel XE#569])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#579]) -> [SKIP][499] ([Intel XE#1201] / [Intel XE#579])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          ([PASS][500], [FAIL][501]) ([Intel XE#958]) -> [FAIL][502] ([Intel XE#958])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#944]) -> [SKIP][504] ([Intel XE#1201] / [Intel XE#944])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     ([SKIP][505], [SKIP][506]) ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][507] ([Intel XE#944])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][509] ([Intel XE#944])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2357
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2484
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7986 -> IGT_7987
  * Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -> xe-pw-137684v1

  IGT_7986: 7986
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70
  xe-pw-137684v1: 137684v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html

--===============2511806626102432739==
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
<tr><td><b>Series:</b></td><td>Replace dma-fence chain with dma-fence array for media GT TLB invalidation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137684/">https://patchwork.freedesktop.org/series/137684/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70_full -&gt; xe-pw-137684v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137684v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137684v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137684v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_pm@s3-mocs.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec@gt1-engine-drm_xe_engine_class_video_enhance.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@xe_exec_threads@threads-hang-shared-vm-rebind:<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-5/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137684v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-edge:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_cursor_edge_walk@128x128-top-edge.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_cursor_edge_walk@128x128-top-edge.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_psr2_sf@cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_vblank@wait-idle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_vblank@wait-idle.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_vblank@wait-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_compute@ccs-mode-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_threads@threads-bal-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_exec_threads@threads-bal-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_oa@mmio-triggered-reports.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-3/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_pm@s3-multiple-execs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s3-multiple-execs.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-436/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-multiple-execs.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@xe_pm_residency@idle-residency-on-exec.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@xe_pm_residency@idle-residency-on-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2484">Intel XE#2484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_spin_batch@spin-fixed-duration.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_wedged@wedged-mode-toggle.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_wedged@wedged-mode-toggle.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset@bd-dp2-hdmi-a3.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-1:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_pm_rpm@i2c.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_vrr@max-min.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-7/igt@kms_vrr@max-min.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-1/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364">Intel XE#2364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-bmg-4/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">DMESG-FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">DMESG-FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@xe_exec_basic@many-rebind.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@xe_exec_basic@many-rebind.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_module_load@reload.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@xe_module_load@reload.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-5/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-4/igt@xe_pm@s4-exec-after.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-1/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@xe_pm@s4-mocs.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_pm@s4-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_hdmi_inject@inject-audio.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_hdmi_inject@inject-audio.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-9/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-6/igt@kms_plane@plane-position-covered.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-434/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-436/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_module_load@load.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_oa@invalid-oa-format-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-466/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-435/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137684v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7986 -&gt; IGT_7987</li>
<li>Linux: xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70 -&gt; xe-pw-137684v1</li>
</ul>
<p>IGT_7986: 7986<br />
  IGT_7987: 89c9c18d654c46a9469c6c414d40f5b63dde9958 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1817-7365d672ab38ee0eabb65fcd359e5774a8efbd70: 7365d672ab38ee0eabb65fcd359e5774a8efbd70<br />
  xe-pw-137684v1: 137684v1</p>

</body>
</html>

--===============2511806626102432739==--
