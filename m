Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB38D3B7E5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 14:19:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C2BE10E161;
	Mon, 29 Dec 2025 14:19:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D6810E161;
 Mon, 29 Dec 2025 14:19:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4965945523404455207=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/=7Bi915=2C_xe=7D/displ?=
 =?utf-8?q?ay=3A_remove_the_-Ddrm=5Fi915=5Fprivate=3Dxe=5Fdevice_hack?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Dec 2025 14:19:33 -0000
Message-ID: <176701797300.119742.14555230568017240304@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1767009044.git.jani.nikula@intel.com>
In-Reply-To: <cover.1767009044.git.jani.nikula@intel.com>
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

--===============4965945523404455207==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/display: remove the -Ddrm_i915_private=xe_device hack
URL   : https://patchwork.freedesktop.org/series/159523/
State : failure

== Summary ==

CI Bug Log - changes from xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f_FULL -> xe-pw-159523v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-159523v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-159523v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-159523v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-159523v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#610])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +2 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#3432]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2724])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2325])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2252]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#6507])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2341])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178]) +3 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2320]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [PASS][15] -> [DMESG-WARN][16] ([Intel XE#5354])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1340])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2244])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([i915#4767])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +8 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2313]) +10 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          [PASS][26] -> [ABORT][27] ([Intel XE#6740]) +1 other test abort
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [ABORT][28] ([Intel XE#6740])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#5021])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#5020])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6886]) +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#6693])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6814])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [PASS][37] -> [SKIP][38] ([Intel XE#1406] / [Intel XE#4692])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2330])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2413])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4837]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2322]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6874]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-race:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#6703]) +128 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#4943]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][47] ([Intel XE#6480])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#5625])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2248])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2284]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [PASS][52] -> [FAIL][53] ([Intel XE#6251])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][54] ([Intel XE#3862]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-10/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-10/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [ABORT][58] ([Intel XE#6740]) -> [PASS][59] +2 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-9/igt@kms_hdr@static-swap.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_hdr@static-swap.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-lnl:          [FAIL][60] ([Intel XE#1874]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][62] ([Intel XE#6321]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-lnl:          [FAIL][64] ([Intel XE#6251]) -> [PASS][65] +4 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][66] ([Intel XE#2327]) -> [SKIP][67] ([Intel XE#6703]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][68] ([Intel XE#1124]) -> [SKIP][69] ([Intel XE#6703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          [SKIP][70] ([Intel XE#367]) -> [SKIP][71] ([Intel XE#6703])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][72] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][73] ([Intel XE#6703])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][74] ([Intel XE#2887]) -> [SKIP][75] ([Intel XE#6703]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][76] ([Intel XE#2325]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_chamelium_color@gamma.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-bmg:          [SKIP][78] ([Intel XE#2252]) -> [SKIP][79] ([Intel XE#6703])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][80] ([Intel XE#2320]) -> [SKIP][81] ([Intel XE#6703])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][82] ([Intel XE#4633]) -> [FAIL][83] ([Intel XE#5299])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][84] ([Intel XE#2244]) -> [SKIP][85] ([Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][86] ([Intel XE#776]) -> [SKIP][87] ([Intel XE#6703])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][88] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][89] ([Intel XE#6703])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][90] ([Intel XE#4141]) -> [SKIP][91] ([Intel XE#6703]) +4 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][92] ([Intel XE#2311]) -> [SKIP][93] ([Intel XE#6703]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][94] ([Intel XE#2313]) -> [SKIP][95] ([Intel XE#6703]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][96] ([Intel XE#1503]) -> [ABORT][97] ([Intel XE#6740])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][98] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][99] ([Intel XE#1406] / [Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-bmg:          [SKIP][100] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][101] ([Intel XE#1406] / [Intel XE#6703]) +3 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][102] ([Intel XE#2413]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][104] ([Intel XE#2426]) -> [SKIP][105] ([Intel XE#2509])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][106] ([Intel XE#1499]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-close:
    - shard-bmg:          [SKIP][108] ([Intel XE#4837]) -> [SKIP][109] ([Intel XE#6703]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug@basic-close.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][110] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][111] ([Intel XE#6703])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][112] ([Intel XE#5793]) -> [SKIP][113] ([Intel XE#6703])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][114] ([Intel XE#2322]) -> [SKIP][115] ([Intel XE#6703]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          [SKIP][116] ([Intel XE#6874]) -> [SKIP][117] ([Intel XE#6703]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:
    - shard-bmg:          [SKIP][118] ([Intel XE#4943]) -> [SKIP][119] ([Intel XE#6703]) +6 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][120] ([Intel XE#579]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][122] ([Intel XE#944]) -> [SKIP][123] ([Intel XE#6703])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767


Build changes
-------------

  * Linux: xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f -> xe-pw-159523v1

  IGT_8679: 8679
  xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f: c4f21b26a21816b3a28bddeeaec7db024fc2e54f
  xe-pw-159523v1: 159523v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html

--===============4965945523404455207==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/display: remove the -Ddrm_i915_private=xe_device hack</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159523/">https://patchwork.freedesktop.org/series/159523/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f_FULL -&gt; xe-pw-159523v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-159523v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-159523v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-159523v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_gt_freq@freq_fixed_idle:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159523v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767">i915#4767</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-10/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +128 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6480">Intel XE#6480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-10/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-10/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-9/igt@kms_hdr@static-swap.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-3/igt@kms_hdr@static-swap.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-5/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-10/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159523v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f -&gt; xe-pw-159523v1</li>
</ul>
<p>IGT_8679: 8679<br />
  xe-4309-c4f21b26a21816b3a28bddeeaec7db024fc2e54f: c4f21b26a21816b3a28bddeeaec7db024fc2e54f<br />
  xe-pw-159523v1: 159523v1</p>

</body>
</html>

--===============4965945523404455207==--
