Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92FACD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 12:22:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891FE10E3F6;
	Wed, 10 Jun 2026 12:22:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471510E3F6;
 Wed, 10 Jun 2026 12:22:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2388658769021471619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Probe_info_outsi?=
 =?utf-8?q?de_of_xe=5Finfo=5Finit=28=29_and_xe=5Finfo=5Finit=5Fearly=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 12:22:07 -0000
Message-ID: <178109412700.64641.377192685603014742@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
In-Reply-To: <20260609-xe-probe-info-v1-0-21e83e188e60@intel.com>
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

--===============2388658769021471619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Probe info outside of xe_info_init() and xe_info_init_early()
URL   : https://patchwork.freedesktop.org/series/168205/
State : failure

== Summary ==

CI Bug Log - changes from xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a_FULL -> xe-pw-168205v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168205v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168205v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168205v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  
Known issues
------------

  Here are the changes found in xe-pw-168205v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#373])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#6974])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1138] / [Intel XE#7344])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1421])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#656] / [Intel XE#7905])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7061] / [Intel XE#7356])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#6312])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2313]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7905]) +4 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7061])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1470])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#7915]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7283])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#7340])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7636]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_evict@evict-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_evict@evict-large-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][22] -> [INCOMPLETE][23] ([Intel XE#6321])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7482]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1392])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7136])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7136])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#6874])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-basic-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:
    - shard-bmg:          NOTRUN -> [ABORT][29] ([Intel XE#8007])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads:
    - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#7850])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6964])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_page_reclaim@binds-null-vma:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7793])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_page_reclaim@binds-null-vma.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#4130] / [Intel XE#7366])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#4351] / [Intel XE#7357])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][36] ([Intel XE#3321]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][38] ([Intel XE#301]) -> [PASS][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][40] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][42] ([Intel XE#1503]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][44] ([Intel XE#7922]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][46] ([Intel XE#8007]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][48] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][49] ([Intel XE#301])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:
    - shard-lnl:          [ABORT][50] ([Intel XE#8007]) -> [SKIP][51] ([Intel XE#6874])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7357
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a -> xe-pw-168205v1

  IGT_8956: 8956
  xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a: 3806de1666bcca0525d737e3849c602cbe98fb1a
  xe-pw-168205v1: 168205v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html

--===============2388658769021471619==
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
<tr><td><b>Series:</b></td><td>drm/xe: Probe info outside of xe_info_init() and xe_info_init_early()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168205/">https://patchwork.freedesktop.org/series/168205/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a_FULL -&gt; xe-pw-168205v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168205v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168205v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168205v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@ts-continuation-dpms-suspend:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168205v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-1/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-10/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@xe_exec_reset@long-spin-reuse-many-preempt-gt0-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-null-vma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_page_reclaim@binds-null-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7357">Intel XE#7357</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-5/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-bmg-3/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a/shard-lnl-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168205v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a -&gt; xe-pw-168205v1</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5228-3806de1666bcca0525d737e3849c602cbe98fb1a: 3806de1666bcca0525d737e3849c602cbe98fb1a<br />
  xe-pw-168205v1: 168205v1</p>

</body>
</html>

--===============2388658769021471619==--
