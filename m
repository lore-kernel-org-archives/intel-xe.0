Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F212C3ABC0
	for <intel-xe@archiver.kernel.org>; Thu,  8 May 2025 16:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E8310E204;
	Thu,  8 May 2025 16:33:44 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3E210E938;
 Thu,  8 May 2025 16:33:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3143777437041960526=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/vsec=3A_Allow_for_k?=
 =?utf-8?q?ernel_context_access?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 May 2025 16:33:43 -0000
Message-ID: <174672202343.60229.18236458881244411762@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250507183907.260707-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250507183907.260707-1-michael.j.ruhl@intel.com>
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

--===============3143777437041960526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vsec: Allow for kernel context access
URL   : https://patchwork.freedesktop.org/series/148726/
State : failure

== Summary ==

CI Bug Log - changes from xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d_FULL -> xe-pw-148726v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148726v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148726v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148726v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +25 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_vm@large-split-binds-2147483648.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_vm@large-split-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][3] ([Intel XE#1124]) -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         [SKIP][5] ([Intel XE#367]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][7] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-adlp:         [SKIP][9] ([Intel XE#373]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][11] ([Intel XE#309]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-adlp:         [SKIP][13] ([Intel XE#310]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-adlp:         [SKIP][15] ([Intel XE#455]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
    - shard-adlp:         [SKIP][17] ([Intel XE#651]) -> [SKIP][18] +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][19] ([Intel XE#656]) -> [SKIP][20] +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         [SKIP][21] ([Intel XE#653]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         [SKIP][23] ([Intel XE#3012]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_joiner@basic-force-big-joiner.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-adlp:         [SKIP][25] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-adlp:         [SKIP][27] ([Intel XE#1489]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         [SKIP][29] ([Intel XE#1122]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-adlp:         [SKIP][31] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr@psr2-cursor-plane-move.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-adlp:         [SKIP][33] ([Intel XE#4837]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_eudebug@multiple-sessions.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_evict@evict-beng-large:
    - shard-adlp:         [SKIP][35] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_evict@evict-beng-large.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_evict@evict-beng-large.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-adlp:         [SKIP][37] ([Intel XE#1392]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-adlp:         [SKIP][39] ([Intel XE#288]) -> [SKIP][40] +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_system_allocator@many-mmap-file:
    - shard-adlp:         [SKIP][41] ([Intel XE#4915]) -> [SKIP][42] +20 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_system_allocator@many-mmap-file.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_system_allocator@many-mmap-file.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         [SKIP][43] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_oa@syncs-syncobj-cfg.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         [SKIP][45] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_pm@d3cold-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-adlp:         [SKIP][47] ([Intel XE#4733]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck}:
    - shard-adlp:         [SKIP][49] ([Intel XE#4915]) -> [SKIP][50] +9 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  
Known issues
------------

  Here are the changes found in xe-pw-148726v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-legacy:
    - shard-adlp:         [PASS][51] -> [SKIP][52] ([Intel XE#4950]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_addfb_basic@addfb25-y-tiled-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][53] -> [FAIL][54] ([Intel XE#827]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#911])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#3767]) +23 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:
    - shard-lnl:          [PASS][58] -> [FAIL][59] ([Intel XE#3908]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1124])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1407])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#1124])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2314] / [Intel XE#2894])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#787]) +153 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2652] / [Intel XE#787]) +15 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#787]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#3442])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#3432])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2907])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#2887]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2887])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][74] ([Intel XE#3124])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][75] ([Intel XE#1727] / [Intel XE#3113])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#373])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#373]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#1178]) +1 other test fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#1178])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2291]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#4302])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1340])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#4294])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#701])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][90] ([Intel XE#301]) +4 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][91] ([Intel XE#3321]) +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][92] -> [FAIL][93] ([Intel XE#301]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#310])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1421]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#2316]) +13 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#301])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][100] -> [INCOMPLETE][101] ([Intel XE#2049] / [Intel XE#2597])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     [PASS][102] -> [INCOMPLETE][103] ([Intel XE#2049])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][104] ([Intel XE#2882])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#651]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#656]) +4 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#651])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2312])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#656]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#653])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][112] ([Intel XE#4735])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping.html
    - shard-adlp:         NOTRUN -> [INCOMPLETE][113] ([Intel XE#1035])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [WARN][114] ([Intel XE#4801])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html
    - shard-adlp:         NOTRUN -> [WARN][115] ([Intel XE#2078]) +1 other test warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][116] ([Intel XE#616])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#4596])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-none.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2763]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2763]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#1439] / [Intel XE#3141])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1489])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1406]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#4689])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1127])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#3414] / [Intel XE#3904])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#455])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][130] -> [SKIP][131] ([Intel XE#1435])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@testdisplay:
    - shard-dg2-set2:     NOTRUN -> [ABORT][132] ([Intel XE#2705])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@testdisplay.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#4837]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@discovery-empty:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#4837]) +1 other test skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_eudebug@discovery-empty.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1392]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1392])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [PASS][137] -> [SKIP][138] ([Intel XE#1392]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_compute_mode@twice-basic:
    - shard-adlp:         [PASS][139] -> [SKIP][140] ([Intel XE#4945]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#4943]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#4915]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#4943]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge.html

  * igt@xe_exec_system_allocator@twice-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#4915]) +11 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_system_allocator@twice-mmap.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          NOTRUN -> [ABORT][147] ([Intel XE#4911])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-adlp:         [PASS][148] -> [FAIL][149] ([Intel XE#3099]) +1 other test fail
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm@d3hot-mmap-system:
    - shard-bmg:          [PASS][150] -> [FAIL][151] ([Intel XE#4938])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@xe_pm@d3hot-mmap-system.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html

  * igt@xe_pm@s3-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#584])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][153] -> [ABORT][154] ([Intel XE#1794])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][155] -> [ABORT][156] ([Intel XE#1794]) +1 other test abort
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          NOTRUN -> [SKIP][157] ([Intel XE#579])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#4733])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#944])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#944])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#944])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@kms_atomic@plane-immutable-zpos:
    - shard-adlp:         [DMESG-WARN][162] ([Intel XE#4173]) -> [PASS][163] +3 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-6/igt@kms_atomic@plane-immutable-zpos.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-6/igt@kms_atomic@plane-immutable-zpos.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][164] ([Intel XE#3908]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][166] ([Intel XE#4543]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][168] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][170] ([Intel XE#3862]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][172] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][174] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][176] ([Intel XE#3124]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][178] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][180] ([Intel XE#2291]) -> [PASS][181] +10 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][182] ([Intel XE#3009]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_dp_aux_dev.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][184] ([Intel XE#4354]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-dg2-set2:     [FAIL][186] ([Intel XE#4772]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][188] ([Intel XE#2373]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_feature_discovery@display-2x.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][190] ([Intel XE#886]) -> [PASS][191] +6 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#301]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][194] ([Intel XE#2316]) -> [PASS][195] +16 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][196] ([Intel XE#2882]) -> [PASS][197] +10 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][198] ([Intel XE#3321]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][200] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][201] +4 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-lnl:          [FAIL][202] ([Intel XE#886]) -> [PASS][203] +3 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     [FAIL][204] ([Intel XE#2882]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [FAIL][206] ([Intel XE#2882]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][208] ([Intel XE#1503]) -> [PASS][209] +2 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][210] ([Intel XE#3012]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][212] ([Intel XE#4596]) -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][214] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_plane_scaling@intel-max-src-size.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][216] ([Intel XE#1499]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_vrr@negative-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#1392]) -> [PASS][219] +7 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][220] ([Intel XE#4929] / [Intel XE#4937]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * {igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap}:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#3428]) -> [PASS][223] +3 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [DMESG-WARN][224] -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@xe_module_load@many-reload.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][226] ([Intel XE#1794]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
    - shard-lnl:          [ABORT][228] ([Intel XE#1794]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][230] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [INCOMPLETE][231] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_color@deep-color:
    - shard-adlp:         [SKIP][232] ([Intel XE#455]) -> [SKIP][233] ([Intel XE#4950])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_color@deep-color.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_color@deep-color.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [DMESG-FAIL][234] ([Intel XE#3428]) -> [FAIL][235] ([Intel XE#1178]) +1 other test fail
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_content_protection@atomic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][236] ([Intel XE#1178]) -> [SKIP][237] ([Intel XE#2341]) +1 other test skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_content_protection@legacy.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][238] ([Intel XE#2341]) -> [FAIL][239] ([Intel XE#1178]) +1 other test fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][240] ([Intel XE#2321]) -> [SKIP][241] ([Intel XE#2320])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][242] -> [FAIL][243] ([Intel XE#1475])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][244] ([Intel XE#2316]) -> [FAIL][245] ([Intel XE#3321])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][246] ([Intel XE#2312]) -> [SKIP][247] ([Intel XE#2311]) +36 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][248] ([Intel XE#4141]) -> [SKIP][249] ([Intel XE#2312]) +8 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][250] ([Intel XE#2312]) -> [SKIP][251] ([Intel XE#4141]) +15 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][252] ([Intel XE#2311]) -> [SKIP][253] ([Intel XE#2312]) +24 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2313]) -> [SKIP][255] ([Intel XE#2312]) +21 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][256] ([Intel XE#656]) -> [SKIP][257] ([Intel XE#4947]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][258] ([Intel XE#2312]) -> [SKIP][259] ([Intel XE#2313]) +39 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][260] ([Intel XE#2493]) -> [SKIP][261] ([Intel XE#4596])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1500]) -> [SKIP][263] ([Intel XE#362])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset:
    - shard-adlp:         [SKIP][264] ([Intel XE#4915]) -> [SKIP][265] ([Intel XE#4945])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][266] ([Intel XE#1173]) -> [SKIP][267] ([Intel XE#1061]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@xe_peer2peer@read.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
  [Intel XE#4772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4772
  [Intel XE#4801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4938
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d -> xe-pw-148726v1

  IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d: c3be982edfd7bb6de5d4d3346d5d4189d7453d8d
  xe-pw-148726v1: 148726v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/index.html

--===============3143777437041960526==
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
<tr><td><b>Series:</b></td><td>drm/xe/vsec: Allow for kernel context access=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148726/">https://patchwork.freedesktop.org/series/148726/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148726v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148726v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d=
7453d8d_FULL -&gt; xe-pw-148726v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148726v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148726v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1487=
26v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_vm@large-split-binds-2147483648:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_vm@l=
arge-split-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_vm@large-spli=
t-binds-2147483648.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_big=
_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@=
kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_bw@=
linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/=
igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_ccs=
@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726=
v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SK=
IP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_cha=
melium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@=
kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_cur=
sor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel =
XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148726v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fli=
p@2x-flip-vs-panning-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/i=
gt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148726v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-=
32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp=
-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html">SKIP</a> +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel X=
E#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148726v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shar=
d-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP=
</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_joi=
ner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms=
_joiner@basic-force-big-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
26v1/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">=
SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr=
2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/i=
gt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr=
2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr2_s=
u@page_flip-p010.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_psr=
@psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-=
2/igt@kms_psr@psr2-cursor-plane-move.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_eude=
bug@multiple-sessions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_eudeb=
ug@multiple-sessions.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_evic=
t@evict-beng-large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@x=
e_evict@evict-beng-large.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_basic@multigpu-once-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@x=
e_exec_basic@multigpu-once-userptr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/i=
gt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-file:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_system_allocator@many-mmap-file.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/i=
gt@xe_exec_system_allocator@many-mmap-file.html">SKIP</a> +20 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_oa@s=
yncs-syncobj-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/sh=
ard-adlp-2/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_pm@d=
3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_pm@=
d3cold-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_pxp@=
pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp=
-2/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-e=
ocheck}:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915"=
>Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueue=
s-mmap-remap-ro-dontunmap-eocheck.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148726v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_add=
fb_basic@addfb25-y-tiled-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_addfb_ba=
sic@addfb25-y-tiled-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_async_f=
lips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-=
lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a=
-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-433/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled@pipe-d-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#376=
7</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-edp-1:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-8/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-b-edp-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/sh=
ard-lnl-1/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +153 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_ccs@bad-rotation-90-y-ti=
led-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ski=
p</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-ena=
ble-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-8/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-4/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@ac-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +4 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-466/igt=
@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-4/igt@kms_=
flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +=
13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-5/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@c-hdmi-a6.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-434/igt@kms_flip@flip-=
vs-suspend@c-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_flip@plain-flip-ts-check-=
interruptible@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane@pixel-format-source=
-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4735">Intel XE#4735</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane@pixel-format-sourc=
e-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane@pixel-format-source=
-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4801">Intel XE#4801</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_plane_multiple@=
2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-p=
rimary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_psr@pr-cursor-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_psr@pr-primary-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_rotation_crc@primary-x-ti=
led-reflect-x-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4689">Intel XE#4689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_scaling_modes@scaling-mo=
de-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@testdisplay.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Inte=
l XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_eudebug@basic-connect.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_eudebug@discovery-empty.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@xe_exec=
_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_compute_mode@twice-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_compute_mo=
de@twice-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_exec_fault_mode@once-bin=
dexecqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_fault_mode@twice-use=
rptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-execqueues-new-bo-map.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-3/igt@xe_exec_system_allocator@twi=
ce-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4915">Intel XE#4915</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_live=
_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_live_ktest@xe_dma_buf.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3099">Intel XE#3099</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@xe_pm@d3=
hot-mmap-system.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@xe_pm@d3hot-mmap-system.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
938">Intel XE#4938</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@s3-basic-exec.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-4/igt@xe_pm@s=
4-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148726v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-6/igt@xe_pm@s4=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148726v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_pxp@pxp-termination-key-=
update-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@xe_query@multigpu-query-inv=
alid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_query@multigpu-query-topo=
logy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-immutable-zpos:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-6/igt@kms_ato=
mic@plane-immutable-zpos.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-6/i=
gt@kms_atomic@plane-immutable-zpos.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/=
shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148726v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148726v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard=
-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shar=
d-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3=
124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48726v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d=
-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148726v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +10 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4772">Intel XE#4772</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-=
1/igt@kms_flip@2x-flip-vs-dpms-on-nop@ab-dp2-hdmi-a3.html">PASS</a> +6 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard=
-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bd-hdmi-a6-dp4.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard=
-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate@bc-dp2-hdmi-a3.html">PASS</a>=
 +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1=
/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1=
/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-1/igt@kms_flip=
@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-3=
/igt@kms_flip@plain-flip-fb-recreate-interruptible.html">PASS</a> +3 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@kms_fl=
ip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-=
432/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-3/igt@kms_fli=
p@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/s=
hard-adlp-4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-3=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shar=
d-bmg-1/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-8/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard=
-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4929">Intel XE#4929</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4937">Intel XE#4937</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-5/igt@xe_exec_system_=
allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-shared-r=
emap-dontunmap}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-mmap-shared-remap-dontunmap.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-large-mmap-shared-remap-dontunmap.html">PASS</a> +3 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@xe_modul=
e_load@many-reload.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@xe_module_load@many-=
reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-lnl-7/igt@xe_pm@s4-v=
m-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-435/igt@km=
s_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_col=
or@deep-color.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-adlp-2/igt@kms_color@deep-col=
or.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@kms=
_content_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-7/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fai=
l</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-1/igt@k=
ms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-=
bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148726v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48726v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148726v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1487=
26v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14872=
6v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8726v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-bmg-3/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148726v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-huge=
-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-adlp-2/igt@xe_exec=
_system_allocator@threads-shared-vm-many-execqueues-mmap-huge-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148726v1/shard-adlp-2/igt@xe_exec_system_allocator@threads-s=
hared-vm-many-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d/shard-dg2-464/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148726v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d -&gt; xe-pw-148=
726v1</li>
</ul>
<p>IGT_8356: 4db4ba9b619fefa181cf0fc73cf8c35d282c61ae @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3047-c3be982edfd7bb6de5d4d3346d5d4189d7453d8d: c3be982edfd7bb6de5d4d33=
46d5d4189d7453d8d<br />
  xe-pw-148726v1: 148726v1</p>

</body>
</html>

--===============3143777437041960526==--
