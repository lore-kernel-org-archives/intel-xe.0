Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA86CA1013
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 17:28:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616210E17E;
	Thu, 18 Sep 2025 17:28:32 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD4910E17E;
 Thu, 18 Sep 2025 17:28:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0840684827444533578=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Allow_pinning_of?=
 =?utf-8?q?_VRAM_dma-bufs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Sep 2025 17:28:31 -0000
Message-ID: <175821651161.345795.4648737524663544165@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
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

--===============0840684827444533578==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Allow pinning of VRAM dma-bufs
URL   : https://patchwork.freedesktop.org/series/154690/
State : failure

== Summary ==

CI Bug Log - changes from xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d_FULL -> xe-pw-154690v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154690v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154690v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154690v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  
New tests
---------

  New tests have been introduced between xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d_FULL and xe-pw-154690v1_FULL:

### New IGT tests (1) ###

  * igt@kms_pm_dc:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-154690v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#316])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#787]) +125 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][11] -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) +1 other test incomplete
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][13] -> [INCOMPLETE][14] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2705] / [Intel XE#4212])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#4417]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#3304])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#2291])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2291])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#4633])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1508])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#4494] / [i915#3804])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2316]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#301])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#4543]) +1 other test dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#301])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#3012])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#616]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_psr@fbc-pr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#1435])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [PASS][45] -> [INCOMPLETE][46] ([Intel XE#4488]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#4837])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1392]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#288])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#3876])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#4915]) +9 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4943]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1173])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][56] ([Intel XE#3908]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][58] ([Intel XE#4543]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][60] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][62] ([Intel XE#2291]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][64] ([Intel XE#2316]) -> [PASS][65] +2 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [DMESG-WARN][66] ([Intel XE#4543]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][68] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][69] +7 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@modeset-vs-vblank-race:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-2/igt@kms_flip@modeset-vs-vblank-race.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_flip@modeset-vs-vblank-race.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][72] ([Intel XE#1503]) -> [PASS][73] +1 other test pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#1392]) -> [PASS][75] +6 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][76] ([Intel XE#2311]) -> [SKIP][77] ([Intel XE#2312]) +8 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][78] ([Intel XE#2312]) -> [SKIP][79] ([Intel XE#2311]) +8 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][80] ([Intel XE#2312]) -> [SKIP][81] ([Intel XE#5390]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][82] ([Intel XE#5390]) -> [SKIP][83] ([Intel XE#2312]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][84] ([Intel XE#2313]) -> [SKIP][85] ([Intel XE#2312]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][86] ([Intel XE#2312]) -> [SKIP][87] ([Intel XE#2313]) +6 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][88] ([Intel XE#3544]) -> [SKIP][89] ([Intel XE#3374] / [Intel XE#3544])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][90] ([Intel XE#1729]) -> [SKIP][91] ([Intel XE#362])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][92] ([Intel XE#1061]) -> [FAIL][93] ([Intel XE#1173])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@xe_peer2peer@write.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d -> xe-pw-154690v1

  IGT_8543: 8543
  xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d: a2488a37d0e639140f346d8fca14cc719297c47d
  xe-pw-154690v1: 154690v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/index.html

--===============0840684827444533578==
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
<tr><td><b>Series:</b></td><td>drm/xe: Allow pinning of VRAM dma-bufs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154690/">https://patchwork.freedesktop.org/series/154690/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d_FULL -&gt; xe-pw-154690v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154690v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-154690v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-154690v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d_FULL and xe-pw-154690v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pm_dc:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154690v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@xe_eudebug@multiple-sessions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-432/igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-adlp-2/igt@kms_flip@modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-adlp-6/igt@kms_flip@modeset-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154690v1/shard-dg2-463/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d -&gt; xe-pw-154690v1</li>
</ul>
<p>IGT_8543: 8543<br />
  xe-3789-a2488a37d0e639140f346d8fca14cc719297c47d: a2488a37d0e639140f346d8fca14cc719297c47d<br />
  xe-pw-154690v1: 154690v1</p>

</body>
</html>

--===============0840684827444533578==--
