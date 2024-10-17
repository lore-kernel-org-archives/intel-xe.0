Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11D1D37480
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 12:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1EE10E7FE;
	Thu, 17 Oct 2024 12:21:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7026710E7FE;
 Thu, 17 Oct 2024 12:21:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3308213483865583111=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_enable_lite_restore?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Yang, Fei" <fei.yang@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Oct 2024 12:21:19 -0000
Message-ID: <172916767944.1278612.885090343858016164@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016223730.921963-1-fei.yang@intel.com>
In-Reply-To: <20241016223730.921963-1-fei.yang@intel.com>
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

--===============3308213483865583111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: enable lite restore
URL   : https://patchwork.freedesktop.org/series/140075/
State : failure

== Summary ==

CI Bug Log - changes from xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67_full -> xe-pw-140075v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140075v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140075v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140075v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@core_hotunplug@hotrebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@core_hotunplug@hotrebind.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:
    - shard-lnl:          [PASS][5] -> [TIMEOUT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html

  * igt@xe_drm_fdinfo@utilization-others-full-load:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@xe_drm_fdinfo@utilization-others-full-load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@xe_drm_fdinfo@utilization-others-full-load.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_vm@partial-unbinds:
    - shard-lnl:          [PASS][11] -> [INCOMPLETE][12] +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_vm@partial-unbinds.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@xe_vm@partial-unbinds.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][13] ([Intel XE#886]) -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][15] ([Intel XE#2105]) -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - {shard-bmg}:        [PASS][17] -> [SKIP][18] +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - {shard-bmg}:        [SKIP][19] ([Intel XE#2327]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - {shard-bmg}:        [SKIP][21] ([Intel XE#2325]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - {shard-bmg}:        [SKIP][23] ([Intel XE#2252]) -> [SKIP][24] +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - {shard-bmg}:        [SKIP][25] ([Intel XE#2390]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - {shard-bmg}:        [SKIP][27] ([Intel XE#2320]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - {shard-bmg}:        [SKIP][29] ([Intel XE#2311]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - {shard-bmg}:        [FAIL][31] ([Intel XE#2333]) -> [SKIP][32] +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - {shard-bmg}:        [SKIP][33] ([Intel XE#2313]) -> [SKIP][34] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_panel_fitting@legacy:
    - {shard-bmg}:        [SKIP][35] ([Intel XE#2486]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_panel_fitting@legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-yf:
    - {shard-bmg}:        [SKIP][37] ([Intel XE#2393]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - {shard-bmg}:        [SKIP][39] ([Intel XE#1489]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - {shard-bmg}:        [SKIP][41] ([Intel XE#2330]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-bmg}:        [PASS][43] -> [DMESG-WARN][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@xe_exec_reset@gt-reset-stress.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_peer2peer@read:
    - {shard-bmg}:        [SKIP][45] ([Intel XE#2427]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@xe_peer2peer@read.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@xe_peer2peer@read.html

  
Known issues
------------

  Here are the changes found in xe-pw-140075v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#623])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#827]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#1701]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][52] -> [FAIL][53] ([Intel XE#1426]) +1 other test fail
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#316])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1124]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#619])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][57] ([Intel XE#1231])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#619])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1124]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#367]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2191])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#367])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#787]) +41 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2907]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#787]) +11 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#2907])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][69] -> [INCOMPLETE][70] ([Intel XE#1195] / [Intel XE#1727])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][71] -> [DMESG-WARN][72] ([Intel XE#3113])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#1195]) +2 other tests incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#306]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#373]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#373]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#455]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#308])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1424])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#455]) +6 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#309])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#323])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#309]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#1475])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#1137])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#310])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#886]) +10 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#1195] / [Intel XE#2049]) +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([i915#5274])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#651]) +15 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#651]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#653]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#656]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +16 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
    - shard-lnl:          [PASS][99] -> [DMESG-WARN][100] ([Intel XE#324]) +4 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#870])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-lnl:          [PASS][102] -> [DMESG-WARN][103] ([Intel XE#1620]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@kms_pm_rpm@modeset-lpsp.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#836])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1489])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#1122])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#2948]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1437])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#327]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#327])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#330])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][115] -> [FAIL][116] ([Intel XE#899]) +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [PASS][117] -> [FAIL][118] ([Intel XE#1523]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@kms_vblank@accuracy-idle.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2168])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#756])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1126])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@discovery-empty:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2905]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#2905]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][125] -> [TIMEOUT][126] ([Intel XE#1473])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - shard-adlp:         [PASS][127] -> [TIMEOUT][128] ([Intel XE#1033] / [Intel XE#1727]) +4 other tests timeout
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-rebind.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1392]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate:
    - shard-lnl:          [PASS][130] -> [DMESG-WARN][131] ([Intel XE#2687])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-invalidate.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#288]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#288]) +14 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][134] ([Intel XE#1962])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_fault_injection@inject-fault-probe:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#2931])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#255])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2541]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#979])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [PASS][139] -> [ABORT][140] ([Intel XE#1794])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@xe_pm@s2idle-mocs.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][141] -> [ABORT][142] ([Intel XE#1358] / [Intel XE#1607])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_pm@s4-exec-after.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][143] -> [FAIL][144] ([Intel XE#958])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#944])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#944])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][147] ([Intel XE#324]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [FAIL][149] ([Intel XE#1701]) -> [PASS][150] +1 other test pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_cursor_edge_walk@128x128-right-edge:
    - shard-lnl:          [FAIL][151] ([Intel XE#3106]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [FAIL][153] ([Intel XE#1475]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [FAIL][155] ([Intel XE#1541]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][157] ([Intel XE#301]) -> [PASS][158] +3 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][159] ([Intel XE#301]) -> [PASS][160] +14 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][161] ([Intel XE#886]) -> [PASS][162] +4 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2:
    - {shard-bmg}:        [FAIL][163] ([Intel XE#2882]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [DMESG-FAIL][165] ([Intel XE#324]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][167] ([Intel XE#718]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - {shard-bmg}:        [INCOMPLETE][169] ([Intel XE#2870]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][171] ([Intel XE#1473]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-lnl:          [FAIL][173] -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][175] ([Intel XE#2105]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#3086]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-3/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [ABORT][179] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [ABORT][181] ([Intel XE#1358]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [ABORT][183] ([Intel XE#1794]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [ABORT][185] ([Intel XE#1794]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-9/igt@xe_pm@s4-mocs.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][187] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][189] ([Intel XE#324]) -> [DMESG-FAIL][190] ([Intel XE#324])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][191] ([Intel XE#324]) -> [FAIL][192] ([Intel XE#1231])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][193] ([Intel XE#1231]) -> [DMESG-FAIL][194] ([Intel XE#324])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][195] ([Intel XE#316]) -> [TIMEOUT][196] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][197] ([Intel XE#1195]) -> [INCOMPLETE][198] ([Intel XE#1195] / [Intel XE#1727])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][199] ([Intel XE#886]) -> [FAIL][200] ([Intel XE#3036])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][201] ([Intel XE#324]) -> [DMESG-FAIL][202] ([Intel XE#324] / [Intel XE#358]) +1 other test dmesg-fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][203] ([Intel XE#1861]) -> [TIMEOUT][204] ([Intel XE#1033] / [Intel XE#1727])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         [SKIP][205] ([Intel XE#1123]) -> [TIMEOUT][206] ([Intel XE#1033] / [Intel XE#1727])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67 -> xe-pw-140075v1

  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67: 87312f4bbb70018f831a8ef565db9cdc37b4da67
  xe-pw-140075v1: 140075v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/index.html

--===============3308213483865583111==
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
<tr><td><b>Series:</b></td><td>drm/xe: enable lite restore</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140075/">https://patchwork.freedesktop.org/series/140075/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67_full -&gt; xe-pw-140075v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140075v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140075v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140075v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@core_hotunplug@hotrebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@xe_dma_buf_sync@export-dma-buf-many-read-write-sync.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-full-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@xe_drm_fdinfo@utilization-others-full-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@xe_drm_fdinfo@utilization-others-full-load.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-3/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@partial-unbinds:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_vm@partial-unbinds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@xe_vm@partial-unbinds.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@xe_peer2peer@read.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140075v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-6/igt@kms_pm_rpm@modeset-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-1/igt@kms_psr@fbc-psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_eudebug@discovery-empty.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +4 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@xe_exec_compute_mode@many-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2931">Intel XE#2931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-434/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-432/igt@xe_pm@s2idle-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-right-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-3/igt@kms_cursor_edge_walk@128x128-right-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-8/igt@kms_cursor_edge_walk@128x128-right-edge.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@d-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2870">Intel XE#2870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-3/igt@xe_pm@s2idle-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-463/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-lnl-7/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140075v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67 -&gt; xe-pw-140075v1</li>
</ul>
<p>IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2073-87312f4bbb70018f831a8ef565db9cdc37b4da67: 87312f4bbb70018f831a8ef565db9cdc37b4da67<br />
  xe-pw-140075v1: 140075v1</p>

</body>
</html>

--===============3308213483865583111==--
