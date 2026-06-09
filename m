Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF08CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 22:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B207710E3BF;
	Tue,  9 Jun 2026 22:00:55 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FEC10E3A3;
 Tue,  9 Jun 2026 22:00:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8599348172526527077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_fix_cross-tile_S?=
 =?utf-8?q?VM_migration_mapping_on_PVC_and_harden_ENOSPC_retry_path?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nishit Sharma" <nishit.sharma@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 22:00:53 -0000
Message-ID: <178104245357.62501.7451331514348483295@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609084003.70975-1-nishit.sharma@intel.com>
In-Reply-To: <20260609084003.70975-1-nishit.sharma@intel.com>
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

--===============8599348172526527077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix cross-tile SVM migration mapping on PVC and harden ENOSPC retry path
URL   : https://patchwork.freedesktop.org/series/168162/
State : failure

== Summary ==

CI Bug Log - changes from xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c_FULL -> xe-pw-168162v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168162v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168162v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168162v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@many-execqueues-malloc:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +23 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@xe_exec_system_allocator@many-execqueues-malloc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_exec_system_allocator@many-execqueues-malloc.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race:
    - shard-lnl:          NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-race.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pm_dc@dc5-pageflip-negative}:
    - shard-bmg:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_pm_dc@dc5-pageflip-negative.html

  
Known issues
------------

  Here are the changes found in xe-pw-168162v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2321] / [Intel XE#7355])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#4210] / [Intel XE#7467])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#4141]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2311]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7399])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2313]) +7 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7283]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1489])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2234] / [Intel XE#2850])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-9/igt@kms_psr@pr-sprite-render.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2322] / [Intel XE#7372])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7136])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6874]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-dyn-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7866])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6964])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          [PASS][22] -> [FAIL][23] ([Intel XE#7992]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][24] ([Intel XE#7571]) -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][26] ([Intel XE#7308]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][28] ([Intel XE#1503]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][30] ([Intel XE#7922]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][32] ([Intel XE#7915]) -> [PASS][33] +3 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-7/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_exec_reset@long-spin-many-preempt-threads:
    - shard-bmg:          [FAIL][34] ([Intel XE#7956]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-threads.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-threads.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][36], [PASS][37], [PASS][38], [SKIP][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-2/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-7/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-2/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-5/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-1/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-7/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-5/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-5/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-7/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-7/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-7/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-8/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-7/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-6/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-6/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-6/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-5/igt@xe_module_load@load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [FAIL][87] -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][89] ([Intel XE#6569]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-6:
    - shard-bmg:          [FAIL][91] ([Intel XE#7992]) -> [PASS][92] +24 other tests pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-6.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-6.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][93] ([Intel XE#3544] / [Intel XE#7916]) -> [SKIP][94] ([Intel XE#3544] / [Intel XE#7915] / [Intel XE#7916])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][95] ([Intel XE#7916]) -> [SKIP][96] ([Intel XE#7915]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][97] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][98] ([Intel XE#2426] / [Intel XE#5848])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          [SKIP][99] ([Intel XE#6964]) -> [INCOMPLETE][100] ([Intel XE#2594])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7916]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992


Build changes
-------------

  * IGT: IGT_8954 -> IGT_8955
  * Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -> xe-pw-168162v1

  IGT_8954: 8954
  IGT_8955: 8955
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9598bfe027c59ac21c
  xe-pw-168162v1: 168162v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/index.html

--===============8599348172526527077==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix cross-tile SVM migration mapping=
 on PVC and harden ENOSPC retry path</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168162/">https://patchwork.freedesktop.org/series/168162/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168162v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168162v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5224-e591d473e392997b89c9ab9598bfe027c=
59ac21c_FULL -&gt; xe-pw-168162v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168162v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168162v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1681=
62v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-malloc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@xe_exec_=
system_allocator@many-execqueues-malloc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_ex=
ec_system_allocator@many-execqueues-malloc.html">ABORT</a> +23 other tests =
abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-rac=
e:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-free-race.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pm_dc@dc5-pageflip-negative}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_pm_dc@dc5-pageflip-negati=
ve.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168162v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-32bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-stor=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcp=
srhdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@kms_plane@pixel-format-y-tile=
d-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-m=
ove-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-9/igt@kms_psr@pr-sprite-render.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-4/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queue=
s-dyn-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-=
cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-=
copy-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvf=
s-random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@xe_sriov=
_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68162v1/shard-bmg-6/igt@xe_sriov_auto_provisioning@resources-released-on-vf=
s-disabling@numvfs-random.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</=
li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-1/igt@kms_hdmi_i=
nject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr=
@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-8/igt@kms_hdr@invalid-hd=
r.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr=
@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shar=
d-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-7/igt@kms_hdr@=
static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1681=
62v1/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb1616=
1616f.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_exec_=
reset@long-spin-many-preempt-threads.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-=
10/igt@xe_exec_reset@long-spin-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4=
/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/sha=
rd-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59a=
c21c/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027=
c59ac21c/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bf=
e027c59ac21c/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab95=
98bfe027c59ac21c/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9=
ab9598bfe027c59ac21c/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b=
89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392=
997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473=
e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591=
d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-=
e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21=
c/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
162v1/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168162v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
162v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168162v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
162v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168162v1/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
162v1/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168162v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl=
-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
162v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-168162v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168162v1/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-4/igt@xe_pmu@fn-eng=
ine-activity-sched-if-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@xe_srio=
v_flr@flr-twice.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-3/igt@xe_sriov_flr@fl=
r-twice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_sriov=
_vfio@bind-unbind-vfs@numvfs-6.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-7/ig=
t@xe_sriov_vfio@bind-unbind-vfs@numvfs-6.html">PASS</a> +24 other tests pas=
s</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr=
@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-6/=
igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel=
 XE#7916</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@kms_hdr=
@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7916">Intel XE#7916</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v=
1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-3-xrgb2101010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shar=
d-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-5/igt@xe_multi=
gpu_svm@mgpu-atomic-op-basic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168162v1/shard-bmg-5/igt@xe=
_multigpu_svm@mgpu-atomic-op-basic.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8954 -&gt; IGT_8955</li>
<li>Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -&gt; xe-pw-168=
162v1</li>
</ul>
<p>IGT_8954: 8954<br />
  IGT_8955: 8955<br />
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9=
598bfe027c59ac21c<br />
  xe-pw-168162v1: 168162v1</p>

</body>
</html>

--===============8599348172526527077==--
