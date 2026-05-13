Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE114CD37B6
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 07:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78CA110ECBD;
	Wed, 13 May 2026 07:30:32 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B47E10E100;
 Wed, 13 May 2026 07:30:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8852267132878887258=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Insert_instead_of_copy_pag?=
 =?utf-8?q?es_into_shmem_when_shrinking?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 07:30:30 -0000
Message-ID: <177865743023.65720.18015778007343456017@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512110339.6244-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260512110339.6244-1-thomas.hellstrom@linux.intel.com>
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

--===============8852267132878887258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Insert instead of copy pages into shmem when shrinking
URL   : https://patchwork.freedesktop.org/series/166409/
State : failure

== Summary ==

CI Bug Log - changes from xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472_FULL -> xe-pw-166409v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166409v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166409v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166409v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@gt-frequency:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-2/igt@xe_pmu@gt-frequency.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
    - shard-bmg:          [FAIL][3] ([Intel XE#6841]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-166409v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][5] -> [INCOMPLETE][6] ([Intel XE#7084]) +1 other test incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#301])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-bmg:          [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#5681])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:
    - shard-bmg:          [PASS][13] -> [DMESG-FAIL][14] ([Intel XE#5545])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-1/igt@kms_vrr@flipline.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@kms_vrr@flipline.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#6703]) +20 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#7072])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  * igt@xe_vm@bind-array-many:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#6557] / [Intel XE#6703])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_vm@bind-array-many.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_vm@bind-array-many.html

  
#### Possible fixes ####

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][23] ([Intel XE#7915]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [DMESG-FAIL][25] -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [FAIL][27] ([Intel XE#4227]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-3/igt@kms_vrr@max-min.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-5/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][29] ([Intel XE#6321]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][31] ([Intel XE#7956]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:
    - shard-bmg:          [FAIL][33] ([Intel XE#7850]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:
    - shard-bmg:          [SKIP][35] ([Intel XE#6703]) -> [PASS][36] +30 other tests pass
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:
    - shard-bmg:          [SKIP][37] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][39] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-1/igt@xe_survivability@runtime-survivability.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-bmg:          [SKIP][41] ([Intel XE#1124]) -> [SKIP][42] ([Intel XE#6703])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_chamelium_audio@dp-audio-edid:
    - shard-bmg:          [SKIP][43] ([Intel XE#2252]) -> [SKIP][44] ([Intel XE#6703])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-edid.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-edid.html

  * igt@kms_cursor_edge_walk@256x256-top-edge:
    - shard-bmg:          [FAIL][45] ([Intel XE#6841]) -> [ABORT][46] ([Intel XE#5545] / [Intel XE#7814])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
    - shard-bmg:          [FAIL][47] ([Intel XE#6841]) -> [DMESG-FAIL][48] ([Intel XE#5545])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][49] ([Intel XE#4141]) -> [SKIP][50] ([Intel XE#6703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][51] ([Intel XE#6703]) -> [SKIP][52] ([Intel XE#4141]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][53] ([Intel XE#6703]) -> [SKIP][54] ([Intel XE#2311]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][55] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][56] ([Intel XE#6703])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] ([Intel XE#6703]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][59] ([Intel XE#6703]) -> [SKIP][60] ([Intel XE#2313]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-bmg:          [DMESG-WARN][61] -> [SKIP][62] ([Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][63] ([Intel XE#6703]) -> [SKIP][64] ([Intel XE#5020] / [Intel XE#7348])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][65] ([Intel XE#6703]) -> [SKIP][66] ([Intel XE#1489])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][67] ([Intel XE#1435]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][69] ([Intel XE#6703]) -> [SKIP][70] ([Intel XE#6503])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html

  * igt@xe_compute@eu-busy-10s:
    - shard-bmg:          [SKIP][71] ([Intel XE#6599]) -> [SKIP][72] ([Intel XE#6703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_compute@eu-busy-10s.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_compute@eu-busy-10s.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][73] ([Intel XE#7140]) -> [SKIP][74] ([Intel XE#6703])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          [SKIP][75] ([Intel XE#6703]) -> [SKIP][76] ([Intel XE#2322] / [Intel XE#7372])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [SKIP][78] ([Intel XE#7136]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-bmg:          [SKIP][79] ([Intel XE#7138]) -> [SKIP][80] ([Intel XE#6703])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][81] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][82] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_peer2peer@write.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_peer2peer@write.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          [SKIP][83] ([Intel XE#944]) -> [SKIP][84] ([Intel XE#6703])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_query@multigpu-query-topology.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_query@multigpu-query-topology.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7072]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -> xe-pw-166409v1

  IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472
  xe-pw-166409v1: 166409v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/index.html

--===============8852267132878887258==
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
<tr><td><b>Series:</b></td><td>Insert instead of copy pages into shmem when shrinking</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166409/">https://patchwork.freedesktop.org/series/166409/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472_FULL -&gt; xe-pw-166409v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166409v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166409v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166409v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@gt-frequency:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-2/igt@xe_pmu@gt-frequency.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@xe_pmu@gt-frequency.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166409v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5681">Intel XE#5681</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_lowres@tiling-x@pipe-b-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7072">Intel XE#7072</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_vm@bind-array-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_vm@bind-array-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-lnl-3/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-lnl-5/igt@kms_vrr@max-min.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-4/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-remap-ro.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_chamelium_audio@dp-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814">Intel XE#7814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_pipe_crc_basic@suspend-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472/shard-bmg-2/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166409v1/shard-bmg-2/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472 -&gt; xe-pw-166409v1</li>
</ul>
<p>IGT_8905: b04ca530eb2959c8edbf9d90f6bb98a9fdee2296 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5048-82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472: 82b65e2afc27ff2bad3e0dfa3fd40c4f39f9f472<br />
  xe-pw-166409v1: 166409v1</p>

</body>
</html>

--===============8852267132878887258==--
