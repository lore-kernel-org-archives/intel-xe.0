Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC18FD58D5C
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 14:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BDFC10E674;
	Mon, 25 Nov 2024 14:55:04 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE43910E674;
 Mon, 25 Nov 2024 14:55:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2373674340098073394=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/ddi=3A_clarify_in?=
 =?utf-8?q?tel=5Fddi=5Fconnector=5Fget=5Fhw=5Fstate=28=29_for_DP_MST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Nov 2024 14:55:02 -0000
Message-ID: <173254650291.2853666.3180655016522290583@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241125120959.2366419-1-jani.nikula@intel.com>
In-Reply-To: <20241125120959.2366419-1-jani.nikula@intel.com>
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

--===============2373674340098073394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST
URL   : https://patchwork.freedesktop.org/series/141748/
State : failure

== Summary ==

CI Bug Log - changes from xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9_full -> xe-pw-141748v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141748v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141748v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141748v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:
    - shard-lnl:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][6] +3 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_sysfs_scheduler@preempt_timeout_us-invalid.html

  * igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2423] / [i915#2575]) -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#2423] / [i915#2575]) -> [SKIP][12] +16 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][13] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][14] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:
    - shard-bmg:          [DMESG-WARN][15] ([Intel XE#3468]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     [SKIP][17] ([Intel XE#2136]) -> [SKIP][18] +14 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#1130]) -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][21] ([Intel XE#2961] / [Intel XE#3191]) -> [INCOMPLETE][22] +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_live_ktest@xe_bo.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  
Known issues
------------

  Here are the changes found in xe-pw-141748v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][23] -> [SKIP][24] ([Intel XE#2423])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@core_getclient.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_getclient.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][25] -> [SKIP][26] ([Intel XE#1885])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1885])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][28] -> [FAIL][29] ([Intel XE#3249])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2134])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#2134]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@fbdev@write.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_3d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#2423])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_3d.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#1033] / [Intel XE#1727])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2550]) +11 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#873])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2327])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][41] ([Intel XE#3468]) +13 other tests dmesg-fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#316]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1124]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#1124]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#2191])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#2423] / [i915#2575]) +29 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2314] / [Intel XE#2894])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#367]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2887]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#2907])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#787]) +62 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#3432])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#787]) +35 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][55] -> [DMESG-WARN][56] ([Intel XE#3468]) +5 other tests dmesg-warn
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][58] ([Intel XE#1727] / [Intel XE#3113])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2325])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#306])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#373]) +6 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2252]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#2715] / [Intel XE#3468]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2320])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#308])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2321])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][68] -> [SKIP][69] ([Intel XE#2423] / [i915#2575]) +57 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2291]) +4 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#309])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@single-move:
    - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#3226])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_cursor_legacy@single-move.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@kms_cursor_legacy@single-move.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#2425])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#307])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr:
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#2958])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-3/igt@kms_fbcon_fbt@psr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#3486])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301]) +2 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][82] -> [FAIL][83] ([Intel XE#3486])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][84] ([Intel XE#3321] / [Intel XE#3486])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#2882]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][87] -> [FAIL][88] ([Intel XE#3321] / [Intel XE#3487])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2316]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#310]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#3486])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][93] ([Intel XE#3468]) +29 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2136]) +26 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][97] ([Intel XE#324]) +1 other test dmesg-fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#455])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#455]) +10 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][100] -> [SKIP][101] ([Intel XE#2351])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@basic.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#651]) +9 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#656]) +32 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [FAIL][104] ([Intel XE#2333]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [PASS][107] -> [SKIP][108] ([Intel XE#2136]) +18 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2312]) +4 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2311]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#2136] / [Intel XE#2351]) +7 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2313]) +8 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][113] ([Intel XE#1727] / [Intel XE#3468])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#653]) +12 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1339])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#1503])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#2927])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2927])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#346])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][121] ([Intel XE#3086])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][122] ([Intel XE#2953] / [Intel XE#3086])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2493])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2763]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2763]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2763]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][129] ([Intel XE#3527])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2446])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_pm_rpm@i2c.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][131] -> [SKIP][132] ([Intel XE#2446]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][133] ([Intel XE#3468]) +5 other tests dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-adlp:         [PASS][134] -> [DMESG-WARN][135] ([Intel XE#3086]) +3 other tests dmesg-warn
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_properties@get_properties-sanity-non-atomic.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1489]) +6 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#1489]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-render.html
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#2939])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#3414]) +2 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         NOTRUN -> [FAIL][142] ([Intel XE#1174])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2426]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][144] -> [FAIL][145] ([Intel XE#899]) +1 other test fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_writeback@writeback-check-output:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#756])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_writeback@writeback-check-output.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#3576])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#1280] / [Intel XE#455])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1126])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#2905]) +6 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug_online@resume-one:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2905]) +3 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_eudebug_online@resume-one.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#688]) +5 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#688])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][154] -> [SKIP][155] ([Intel XE#1130]) +120 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#2322]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1392]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288]) +18 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2360])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-hang-rebind:
    - shard-adlp:         [PASS][160] -> [TIMEOUT][161] ([Intel XE#1033] / [Intel XE#1727])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_exec_threads@threads-hang-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][162] ([Intel XE#3467])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][163] -> [DMESG-WARN][164] ([Intel XE#3086] / [Intel XE#3343])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-bmg:          NOTRUN -> [FAIL][165] ([Intel XE#3499])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][166] -> [SKIP][167] ([Intel XE#2229]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#2229]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][169] ([Intel XE#1999]) +2 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][170] ([Intel XE#1008])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_mmap@vram.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [PASS][171] -> [DMESG-WARN][172] ([Intel XE#3467])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@xe_module_load@unload.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@xe_module_load@unload.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#3573]) +5 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2427])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@xe_peer2peer@read.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#1061])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_peer2peer@read.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][176] ([Intel XE#1173])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][177] -> [DMESG-WARN][178] ([Intel XE#2953] / [Intel XE#3086]) +5 other tests dmesg-warn
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][179] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#944]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@large-binds-2147483648:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#1130]) +44 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_vm@large-binds-2147483648.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1885]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#3086]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-3/igt@core_hotunplug@unbind-rebind.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2423] / [i915#2575]) -> [PASS][188] +53 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][189] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][190] +1 other test pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][192] +5 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][193] ([Intel XE#2291]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][195] ([Intel XE#877]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][197] ([Intel XE#2882]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][199] ([Intel XE#2316]) -> [PASS][200] +2 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][201] ([Intel XE#886]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#2597]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][205] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2136]) -> [PASS][208] +16 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][209] ([Intel XE#3012]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][211] ([Intel XE#1430]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2446]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-adlp:         [INCOMPLETE][215] -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-180.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][217] ([Intel XE#899]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2423]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@testdisplay.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@testdisplay.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1130]) -> [PASS][222] +126 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_compute_mode@non-blocking:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#3468]) -> [PASS][224] +7 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@xe_exec_compute_mode@non-blocking.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@xe_exec_compute_mode@non-blocking.html

  * igt@xe_exec_fault_mode@twice-userptr-imm:
    - shard-lnl:          [DMESG-WARN][225] -> [PASS][226] +1 other test pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-imm.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@xe_exec_fault_mode@twice-userptr-imm.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [DMESG-FAIL][227] ([Intel XE#3371] / [Intel XE#3468]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-bmg:          [DMESG-WARN][229] -> [PASS][230] +3 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_exec_threads@threads-cm-userptr.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-lnl:          [DMESG-WARN][231] ([Intel XE#3371]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [DMESG-WARN][233] ([Intel XE#3184]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][235] ([Intel XE#1794]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][237] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#2423] / [i915#2575]) -> [SKIP][240] ([i915#6077]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-dg2-set2:     [DMESG-WARN][241] -> [SKIP][242] ([Intel XE#2423] / [i915#2575])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_addfb_basic@legacy-format.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_async_flips@test-time-stamp:
    - shard-dg2-set2:     [INCOMPLETE][243] ([Intel XE#1727]) -> [SKIP][244] ([Intel XE#2423] / [i915#2575])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_async_flips@test-time-stamp.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#316]) -> [SKIP][246] ([Intel XE#2136] / [Intel XE#2351])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2136]) -> [SKIP][248] ([Intel XE#316]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#829]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#316]) -> [SKIP][252] ([Intel XE#2136]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][253] ([Intel XE#1727]) -> [SKIP][254] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-FAIL][255] ([Intel XE#3468]) -> [DMESG-FAIL][256] ([Intel XE#1727] / [Intel XE#3468])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2136] / [Intel XE#2351]) -> [DMESG-WARN][258] ([Intel XE#1727])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [FAIL][259] ([Intel XE#1874]) -> [TIMEOUT][260] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#610]) -> [SKIP][262] ([Intel XE#2136])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1124]) -> [SKIP][264] ([Intel XE#2136]) +9 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][266] ([Intel XE#829]) +2 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#2136]) -> [SKIP][268] ([Intel XE#1124])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][270] ([Intel XE#1124]) +4 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1124]) -> [SKIP][272] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#367]) -> [SKIP][274] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2191]) -> [SKIP][276] ([Intel XE#2423] / [i915#2575])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2423] / [i915#2575]) -> [SKIP][278] ([Intel XE#367]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][280] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][282] ([Intel XE#2136]) +4 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136]) -> [SKIP][284] ([Intel XE#2907]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][287] ([Intel XE#3468]) -> [SKIP][288] ([Intel XE#2136])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136] / [Intel XE#2351]) -> [INCOMPLETE][290] ([Intel XE#1727])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2907]) -> [SKIP][292] ([Intel XE#2136]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][294] ([Intel XE#2136] / [Intel XE#2351])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [SKIP][296] ([Intel XE#306])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#306]) -> [SKIP][298] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_chamelium_color@gamma.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#373]) -> [SKIP][300] ([Intel XE#2423] / [i915#2575]) +9 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#2423] / [i915#2575]) -> [SKIP][302] ([Intel XE#373]) +8 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][303] ([Intel XE#1178]) -> [SKIP][304] ([Intel XE#2341]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_content_protection@atomic.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#307]) -> [SKIP][306] ([Intel XE#2423] / [i915#2575])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#455]) -> [SKIP][308] ([Intel XE#2423] / [i915#2575]) +6 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_content_protection@lic-type-1.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2423] / [i915#2575]) -> [SKIP][310] ([Intel XE#308]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][312] ([Intel XE#1727])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#2423] / [i915#2575]) -> [SKIP][314] ([Intel XE#323])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][315] ([Intel XE#2291]) -> [DMESG-WARN][316] ([Intel XE#3468])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][317] ([Intel XE#877]) -> [SKIP][318] ([Intel XE#2291])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [DMESG-FAIL][319] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][320] ([Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_draw_crc@draw-method-render.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#1137]) -> [SKIP][322] ([Intel XE#2423] / [i915#2575])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [INCOMPLETE][323] ([Intel XE#2635]) -> [SKIP][324] ([Intel XE#2316])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2423] / [i915#2575]) -> [FAIL][326] ([Intel XE#301])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-dg2-set2:     [DMESG-WARN][327] ([Intel XE#1727]) -> [SKIP][328] ([Intel XE#2423] / [i915#2575])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_flip@basic-flip-vs-dpms.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][329] ([Intel XE#3468]) -> [DMESG-WARN][330] ([Intel XE#2705] / [Intel XE#3468])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][331] ([Intel XE#1727] / [Intel XE#2049] / [Intel XE#2597] / [Intel XE#3468]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [INCOMPLETE][333] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][335] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][336] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#455]) -> [SKIP][338] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#455]) -> [SKIP][340] ([Intel XE#2136]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([i915#5274])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#651]) -> [SKIP][344] ([Intel XE#2136]) +17 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][345] ([Intel XE#2312]) -> [SKIP][346] ([Intel XE#2311]) +7 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][348] ([Intel XE#651]) +7 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][349] ([Intel XE#1861]) -> [TIMEOUT][350] ([Intel XE#1033] / [Intel XE#1727])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [FAIL][351] ([Intel XE#2333]) -> [SKIP][352] ([Intel XE#2312]) +5 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#2136]) -> [ABORT][354] ([Intel XE#3468])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][355] ([Intel XE#2312]) -> [FAIL][356] ([Intel XE#2333]) +1 other test fail
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][357] ([Intel XE#2312]) -> [DMESG-FAIL][358] ([Intel XE#3468]) +2 other tests dmesg-fail
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [DMESG-FAIL][359] ([Intel XE#3468]) -> [DMESG-WARN][360] ([Intel XE#3468])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#658]) -> [SKIP][362] ([Intel XE#2136] / [Intel XE#2351])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#651]) +11 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][365] ([Intel XE#2311]) -> [SKIP][366] ([Intel XE#2312]) +13 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#651]) -> [SKIP][368] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][369] ([Intel XE#2313]) -> [SKIP][370] ([Intel XE#2312]) +13 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][372] ([Intel XE#656])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][373] ([Intel XE#2312]) -> [SKIP][374] ([Intel XE#2313]) +9 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2136]) -> [SKIP][376] ([Intel XE#455]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2136]) -> [SKIP][378] ([Intel XE#1158])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#653]) -> [SKIP][380] ([Intel XE#2136]) +18 other tests skip
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][382] ([Intel XE#653]) +5 other tests skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#2136]) -> [SKIP][384] ([Intel XE#653]) +13 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#653]) -> [SKIP][386] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_getfb@getfb2-handle-zero:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2423] / [i915#2575]) -> [SKIP][388] ([Intel XE#687]) +1 other test skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_getfb@getfb2-handle-zero.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_getfb@getfb2-handle-zero.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#2925]) -> [SKIP][390] ([Intel XE#2136])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [INCOMPLETE][391] ([Intel XE#2566] / [Intel XE#3468]) -> [INCOMPLETE][392] ([Intel XE#1035] / [Intel XE#2566] / [Intel XE#3468])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [INCOMPLETE][393] ([Intel XE#1727] / [Intel XE#3468]) -> [INCOMPLETE][394] ([Intel XE#1035] / [Intel XE#1727] / [Intel XE#3468]) +1 other test incomplete
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][396] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#2423] / [i915#2575]) -> [SKIP][398] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][400] ([Intel XE#1129])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][401] ([Intel XE#3325]) -> [SKIP][402] ([Intel XE#734])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2136]) -> [FAIL][404] ([Intel XE#3527])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2446]) -> [INCOMPLETE][406] ([Intel XE#1727] / [Intel XE#3468])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_pm_rpm@cursor.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#2446]) -> [DMESG-WARN][408] ([Intel XE#2042] / [Intel XE#3468])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1489]) -> [SKIP][410] ([Intel XE#2136]) +6 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#2136]) -> [SKIP][412] ([Intel XE#1489]) +4 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#2136]) -> [SKIP][414] ([Intel XE#1122])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][416] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][418] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][420] ([Intel XE#2136]) +11 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_psr@psr2-basic.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_psr@psr2-basic.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2136]) -> [SKIP][422] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-onoff.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2423] / [i915#2575]) -> [SKIP][424] ([Intel XE#1127])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#2423] / [i915#2575]) -> [SKIP][426] ([Intel XE#3414]) +1 other test skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_vblank@query-busy:
    - shard-bmg:          [DMESG-WARN][427] ([Intel XE#3468]) -> [DMESG-FAIL][428] ([Intel XE#3468]) +5 other tests dmesg-fail
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_vblank@query-busy.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_vblank@query-busy.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#2423] / [i915#2575]) -> [SKIP][430] ([Intel XE#455]) +5 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_vrr@flip-dpms.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#2423] / [i915#2575]) -> [SKIP][432] ([Intel XE#2168])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_vrr@lobf.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#756]) -> [SKIP][434] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#1130]) -> [SKIP][436] ([Intel XE#1280] / [Intel XE#455])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1123]) -> [SKIP][438] ([Intel XE#1130])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1130]) -> [SKIP][440] ([Intel XE#1123])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#2905]) -> [SKIP][442] ([Intel XE#1130]) +4 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_eudebug_online@interrupt-other-debuggable.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-dg2-set2:     [SKIP][443] -> [SKIP][444] ([Intel XE#1130])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_eudebug_online@pagefault-write.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#1130]) -> [SKIP][446] ([Intel XE#2905]) +9 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [INCOMPLETE][447] -> [TIMEOUT][448] ([Intel XE#1473])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][449] ([Intel XE#1473]) -> [SKIP][450] ([Intel XE#1130])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@once-cm-parallel-userptr:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#1130]) -> [DMESG-WARN][452] ([Intel XE#1727]) +3 other tests dmesg-warn
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_balancer@once-cm-parallel-userptr.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_balancer@once-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][453] ([Intel XE#1392]) -> [TIMEOUT][454] ([Intel XE#1033] / [Intel XE#1727])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1130]) -> [SKIP][456] ([Intel XE#288]) +22 other tests skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#288]) -> [SKIP][458] ([Intel XE#1130]) +20 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#1130]) -> [SKIP][460] ([Intel XE#2360])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#2360]) -> [SKIP][462] ([Intel XE#1130])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_threads@threads-hang-fd-userptr:
    - shard-dg2-set2:     [DMESG-WARN][463] ([Intel XE#1727] / [Intel XE#358]) -> [SKIP][464] ([Intel XE#1130])
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-dg2-set2:     [DMESG-WARN][465] ([Intel XE#3467]) -> [SKIP][466] ([Intel XE#1130]) +2 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][467] ([Intel XE#1130]) -> [DMESG-WARN][468] ([Intel XE#3343])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          [DMESG-WARN][469] ([Intel XE#3467]) -> [DMESG-WARN][470] ([Intel XE#3467] / [Intel XE#3468])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [DMESG-WARN][471] ([Intel XE#3343] / [Intel XE#3468]) -> [DMESG-WARN][472] ([Intel XE#3343])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [DMESG-WARN][473] ([Intel XE#3343]) -> [SKIP][474] ([Intel XE#1130])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][475] ([Intel XE#3467]) -> [DMESG-FAIL][476] ([Intel XE#3467] / [Intel XE#3468])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#1130]) -> [DMESG-WARN][478] ([Intel XE#3467]) +1 other test dmesg-warn
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][479] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][480] ([Intel XE#3467])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#255]) -> [SKIP][482] ([Intel XE#1130])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [FAIL][483] ([Intel XE#3546]) -> [DMESG-FAIL][484] ([Intel XE#3467])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_module_load@reload-no-display.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][485] ([Intel XE#3573]) -> [SKIP][486] ([Intel XE#1130]) +5 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#1130]) -> [SKIP][488] ([Intel XE#3573]) +3 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_oa@syncs-ufence-wait-cfg.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#1130]) -> [SKIP][490] ([Intel XE#1337])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         [SKIP][491] ([Intel XE#979]) -> [TIMEOUT][492] ([Intel XE#1033] / [Intel XE#1727])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#1061]) -> [FAIL][494] ([Intel XE#1173])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_peer2peer@write.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][495] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][496] ([Intel XE#1130]) +1 other test skip
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-mocs:
    - shard-dg2-set2:     [DMESG-WARN][497] ([Intel XE#3468]) -> [SKIP][498] ([Intel XE#1130])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@d3hot-mocs.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#1130]) -> [DMESG-WARN][500] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm@s2idle-basic.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][501] ([Intel XE#1130]) -> [DMESG-WARN][502] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [DMESG-WARN][503] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569]) -> [SKIP][504] ([Intel XE#1130])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@s3-exec-after.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          [DMESG-WARN][505] ([Intel XE#3468]) -> [DMESG-WARN][506] ([Intel XE#1727] / [Intel XE#3468])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_pm@s4-basic.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#1130]) -> [DMESG-WARN][508] ([Intel XE#1727] / [Intel XE#3088] / [Intel XE#3468])
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#944]) -> [SKIP][510] ([Intel XE#1130]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#1130]) -> [SKIP][512] ([Intel XE#944]) +3 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#3342]) -> [SKIP][514] ([Intel XE#1130])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_tlb@basic-tlb:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#1130]) -> [FAIL][516] ([Intel XE#2922])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@xe_tlb@basic-tlb.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_tlb@basic-tlb.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-bmg:          [DMESG-WARN][517] ([Intel XE#1727]) -> [DMESG-WARN][518] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][519] ([Intel XE#2919]) -> [SKIP][520] ([Intel XE#1130])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_wedged@basic-wedged.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9 -> xe-pw-141748v1

  IGT_8124: 8124
  xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9: b21f1413ea1860e80fd278112e820e6dadfc9df9
  xe-pw-141748v1: 141748v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/index.html

--===============2373674340098073394==
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
<tr><td><b>Series:</b></td><td>drm/i915/ddi: clarify intel_ddi_connector_get_hw_state() for DP MST</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141748/">https://patchwork.freedesktop.org/series/141748/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9_full -&gt; xe-pw-141748v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141748v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141748v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141748v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_flip@blocking-absolute-wf_vblank.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-5/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind-imm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@preempt_timeout_us-invalid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_sysfs_scheduler@preempt_timeout_us-invalid.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_vm@mmap-style-bind-many-either-side-partial-hammer.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_edge_walk@128x128-right-edge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_cursor_edge_walk@128x128-right-edge.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-3.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-userptr-invalidate-race.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141748v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@core_getclient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@linear-8bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +13 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_cursor_legacy@single-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@kms_cursor_legacy@single-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-3/igt@kms_fbcon_fbt@psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@kms_fbcon_fbt@psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2958">Intel XE#2958</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +29 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_lpsp@kms-lpsp@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-6/igt@kms_properties@get_properties-sanity-non-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-8/igt@kms_properties@get_properties-sanity-non-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_psr@fbc-psr2-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_eudebug_online@resume-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +120 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_exec_threads@threads-hang-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_exec_threads@threads-hang-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@xe_module_load@unload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-6/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_vm@large-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +44 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-3/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +53 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_rotation_crc@primary-rotation-180.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_balancer@twice-virtual-basic.html">PASS</a> +126 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@non-blocking:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@xe_exec_compute_mode@non-blocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@xe_exec_compute_mode@non-blocking.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-imm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@xe_exec_fault_mode@twice-userptr-imm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-7/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-3/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-lnl-3/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_addfb_basic@legacy-format.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_addfb_basic@legacy-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_async_flips@test-time-stamp.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_async_flips@test-time-stamp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@kms_draw_crc@draw-method-render.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-rte.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-zero:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_getfb@getfb2-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_getfb@getfb2-handle-zero.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_pm_rpm@cursor.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@kms_vblank@query-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@kms_vblank@query-busy.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-432/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-other-debuggable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_balancer@once-cm-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_balancer@once-cm-parallel-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm@s2idle-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-6/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-3/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-463/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_tlb@basic-tlb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-434/igt@xe_tlb@basic-tlb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-435/igt@xe_tlb@basic-tlb.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922">Intel XE#2922</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-bmg-1/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-bmg-7/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9/shard-dg2-436/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141748v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9 -&gt; xe-pw-141748v1</li>
</ul>
<p>IGT_8124: 8124<br />
  xe-2270-b21f1413ea1860e80fd278112e820e6dadfc9df9: b21f1413ea1860e80fd278112e820e6dadfc9df9<br />
  xe-pw-141748v1: 141748v1</p>

</body>
</html>

--===============2373674340098073394==--
