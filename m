Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FF9CD98C5
	for <intel-xe@archiver.kernel.org>; Sat, 13 Jun 2026 10:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE29110E0AC;
	Sat, 13 Jun 2026 10:39:15 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1D910E0AC;
 Sat, 13 Jun 2026 10:39:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8843531547417528536=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/display=3A_skip_FOR?=
 =?utf-8?q?CE=5FWC_and_vm=5Fbound_check_for_external_dma-bufs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 13 Jun 2026 10:39:14 -0000
Message-ID: <178134715428.76225.8127422526315249236@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260612170501.550816-2-matthew.auld@intel.com>
In-Reply-To: <20260612170501.550816-2-matthew.auld@intel.com>
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

--===============8843531547417528536==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: skip FORCE_WC and vm_bound check for external dma-bufs
URL   : https://patchwork.freedesktop.org/series/168451/
State : failure

== Summary ==

CI Bug Log - changes from xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d_FULL -> xe-pw-168451v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168451v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168451v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168451v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html

  
Known issues
------------

  Here are the changes found in xe-pw-168451v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-lnl:          [PASS][3] -> [ABORT][4] ([Intel XE#4760])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#3432])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#7571])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1508])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-basic:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#8265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8265])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#5408] / [Intel XE#6266]) +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@c-dp2:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6266])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@c-dp2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@c-dp2.html

  * igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#7915]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#7340])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2234] / [Intel XE#2850])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-10/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][25] -> [FAIL][26] ([Intel XE#6361]) +3 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-7/igt@kms_setmode@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#6361]) +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7636]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7636])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6874])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-basic.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7866])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7590])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#7590] / [Intel XE#7772])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-8/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#7992]) +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][37] ([Intel XE#7445]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@intel_hwmon@hwmon-write.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][39] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2:
    - shard-bmg:          [ABORT][41] ([Intel XE#8007]) -> [PASS][42] +2 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][43] ([Intel XE#7915]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][45] ([Intel XE#7340]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][47] ([Intel XE#2142]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][49] ([Intel XE#6321]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_reset@long-spin-many-preempt-threads:
    - shard-bmg:          [FAIL][51] ([Intel XE#7956]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html

  * igt@xe_exec_system_allocator@many-malloc-busy-nomemset:
    - shard-lnl:          [ABORT][53] ([Intel XE#8007]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-5/igt@xe_exec_system_allocator@many-malloc-busy-nomemset.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-4/igt@xe_exec_system_allocator@many-malloc-busy-nomemset.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-bmg:          [FAIL][55] ([Intel XE#6569]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][57] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][58] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][59] ([Intel XE#7916]) -> [SKIP][60] ([Intel XE#7915]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][61] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][62] ([Intel XE#2426] / [Intel XE#5848])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:
    - shard-lnl:          [SKIP][63] ([Intel XE#7136]) -> [ABORT][64] ([Intel XE#8007])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html
    - shard-bmg:          [SKIP][65] ([Intel XE#7136]) -> [ABORT][66] ([Intel XE#8007])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html

  
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265


Build changes
-------------

  * IGT: IGT_8961 -> IGT_8962
  * Linux: xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d -> xe-pw-168451v1

  IGT_8961: 8961
  IGT_8962: 8962
  xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d
  xe-pw-168451v1: 168451v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html

--===============8843531547417528536==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: skip FORCE_WC and vm_bound check for external dma-bufs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168451/">https://patchwork.freedesktop.org/series/168451/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d_FULL -&gt; xe-pw-168451v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168451v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168451v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168451v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168451v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-3/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-9/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_flip@wf_vblank-ts-check@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-10/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-8/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@exclusive-ranges@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7445">Intel XE#7445</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x128@pipe-a-dp-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-3/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-busy-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-5/igt@xe_exec_system_allocator@many-malloc-busy-nomemset.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-4/igt@xe_exec_system_allocator@many-malloc-busy-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@xe_sriov_flr@flr-vfs-parallel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-7/igt@xe_sriov_flr@flr-vfs-parallel.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-3/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-lnl-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168451v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8961 -&gt; IGT_8962</li>
<li>Linux: xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d -&gt; xe-pw-168451v1</li>
</ul>
<p>IGT_8961: 8961<br />
  IGT_8962: 8962<br />
  xe-5248-536f4e1338749a805ec4a7b82b1444dae2c6fe4d: 536f4e1338749a805ec4a7b82b1444dae2c6fe4d<br />
  xe-pw-168451v1: 168451v1</p>

</body>
</html>

--===============8843531547417528536==--
