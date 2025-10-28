Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C01CCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 00:12:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C6D10E0D9;
	Tue, 28 Oct 2025 00:12:36 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E40710E0D9;
 Tue, 28 Oct 2025 00:12:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6710644333664702969=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_serialization_on_burst?=
 =?utf-8?q?_of_unbinds_-_v2?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 28 Oct 2025 00:12:35 -0000
Message-ID: <176161035550.59660.18099196180889577918@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251027182737.2358096-1-matthew.brost@intel.com>
In-Reply-To: <20251027182737.2358096-1-matthew.brost@intel.com>
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

--===============6710644333664702969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix serialization on burst of unbinds - v2
URL   : https://patchwork.freedesktop.org/series/156606/
State : failure

== Summary ==

CI Bug Log - changes from xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2_FULL -> xe-pw-156606v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156606v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156606v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156606v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:
    - shard-dg2-set2:     [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html

  * igt@xe_waitfence@abstime:
    - shard-dg2-set2:     [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-436/igt@xe_waitfence@abstime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-463/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-8/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-3/igt@xe_waitfence@engine.html
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-464/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-436/igt@xe_waitfence@engine.html

  
Known issues
------------

  Here are the changes found in xe-pw-156606v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#1124])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][15] -> [INCOMPLETE][16] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1727] / [Intel XE#3113])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][19] -> [INCOMPLETE][20] ([Intel XE#6168])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][21] -> [INCOMPLETE][22] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2252])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2291]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#4543]) +1 other test dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][35] -> [DMESG-WARN][36] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][37] -> [FAIL][38] ([Intel XE#3098]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-433/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2293] / [Intel XE#2380])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2293])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#5390]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2311]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2313]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#4596])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#1489])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-2/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2330])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#1435])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#4837]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][52] -> [INCOMPLETE][53] ([Intel XE#6321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2322])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_system_allocator@many-stride-malloc-prefetch:
    - shard-bmg:          [PASS][55] -> [WARN][56] ([Intel XE#5786])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4943]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2284])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][59] -> [ABORT][60] ([Intel XE#4917] / [Intel XE#5545]) +1 other test abort
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][61] ([Intel XE#4543]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][63] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][65] ([Intel XE#3009]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_dp_aux_dev.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][67] ([Intel XE#2316]) -> [PASS][68] +3 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [DMESG-WARN][69] ([Intel XE#4543]) -> [PASS][70] +6 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][71] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][73] ([Intel XE#3012]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][76] +3 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][77] ([Intel XE#1178]) -> [SKIP][78] ([Intel XE#2341])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_content_protection@atomic.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][79] ([Intel XE#2311]) -> [SKIP][80] ([Intel XE#2312]) +11 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][81] ([Intel XE#2312]) -> [SKIP][82] ([Intel XE#2311]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][83] ([Intel XE#2312]) -> [SKIP][84] ([Intel XE#5390]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][85] ([Intel XE#5390]) -> [SKIP][86] ([Intel XE#2312]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][87] ([Intel XE#2312]) -> [SKIP][88] ([Intel XE#2313]) +8 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][89] ([Intel XE#2313]) -> [SKIP][90] ([Intel XE#2312]) +11 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][91] ([Intel XE#3544]) -> [SKIP][92] ([Intel XE#3374] / [Intel XE#3544])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][93] ([Intel XE#5021]) -> [SKIP][94] ([Intel XE#4596])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#1500]) -> [SKIP][96] ([Intel XE#362])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
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
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2 -> xe-pw-156606v1

  IGT_8597: 8597
  xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2: a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2
  xe-pw-156606v1: 156606v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/index.html

--===============6710644333664702969==
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
<tr><td><b>Series:</b></td><td>Fix serialization on burst of unbinds - v2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156606/">https://patchwork.freedesktop.org/series/156606/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2_FULL -&gt; xe-pw-156606v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156606v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156606v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156606v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-434/igt@xe_exec_threads@threads-bal-mixed-userptr-invalidate.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-436/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-463/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-8/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-3/igt@xe_waitfence@engine.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-464/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-436/igt@xe_waitfence@engine.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156606v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-8/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-433/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-432/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-2/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-8/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-4/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156606v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2 -&gt; xe-pw-156606v1</li>
</ul>
<p>IGT_8597: 8597<br />
  xe-3991-a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2: a0a8d78f9cb5cbaf99b44f07b427cf6245f5b0b2<br />
  xe-pw-156606v1: 156606v1</p>

</body>
</html>

--===============6710644333664702969==--
