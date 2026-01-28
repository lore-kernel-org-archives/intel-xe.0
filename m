Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EDD35667
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 02:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B315110E60A;
	Wed, 28 Jan 2026 02:23:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53FB10E60A;
 Wed, 28 Jan 2026 02:23:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2434697784885999745=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Crescent_Island_PMT_suppor?=
 =?utf-8?q?t?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jan 2026 02:23:48 -0000
Message-ID: <176956702866.198092.12234538569408426179@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127182418.640701-7-michael.j.ruhl@intel.com>
In-Reply-To: <20260127182418.640701-7-michael.j.ruhl@intel.com>
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

--===============2434697784885999745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support
URL   : https://patchwork.freedesktop.org/series/160717/
State : success

== Summary ==

CI Bug Log - changes from xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24_FULL -> xe-pw-160717v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24_FULL and xe-pw-160717v1_FULL:

### New IGT tests (7) ###

  * igt@xe_create@exec-queue-create-invalid-reserved:
    - Statuses : 2 pass(s)
    - Exec time: [0.0, 0.00] s

  * igt@xe_create@exec-queue-destroy-invalid-reserved:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_create@invalid-exec-queue-id:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_create@invalid-extensions:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  * igt@xe_create@invalid-flag:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_create@invalid-len:
    - Statuses : 2 pass(s)
    - Exec time: [0.0] s

  * igt@xe_create@invalid-pad:
    - Statuses : 1 pass(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-160717v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7063])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-3/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-2/igt@kms_async_flips@async-flip-hang@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#6715])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@blocking-wf_vblank@a-dp2:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#6266]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/igt@kms_flip@blocking-wf_vblank@a-dp2.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@kms_flip@blocking-wf_vblank@a-dp2.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][10] -> [DMESG-FAIL][11] ([Intel XE#5545]) +1 other test dmesg-fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2311])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2313]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7131]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#3414] / [Intel XE#3904])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1499])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#6321])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7136]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6874])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#7023])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-1/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:
    - shard-bmg:          [PASS][24] -> [INCOMPLETE][25] ([Intel XE#2594])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_exec_reset@long-spin-many-preempt-gt0-threads.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4943])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#6703]) +93 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#6557] / [Intel XE#6703])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#944])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_query@multigpu-query-pxp-status.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][32] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][34] ([Intel XE#5299]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][36] ([Intel XE#3098]) -> [PASS][37] +1 other test pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][38] ([Intel XE#301]) -> [PASS][39] +1 other test pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [SKIP][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65]) ([Intel XE#2457]) -> ([PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-9/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-4/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-4/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-9/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-9/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-4/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-3/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          [SKIP][90] ([Intel XE#2327]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][92] ([Intel XE#1124]) -> [SKIP][93] ([Intel XE#6703])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][94] ([Intel XE#2887]) -> [SKIP][95] ([Intel XE#6703]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          [SKIP][96] ([Intel XE#2325]) -> [SKIP][97] ([Intel XE#6703])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_chamelium_color@ctm-0-75.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          [SKIP][98] ([Intel XE#2252]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_chamelium_frames@hdmi-crc-fast.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          [SKIP][100] ([Intel XE#2320]) -> [SKIP][101] ([Intel XE#6703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          [SKIP][102] ([Intel XE#2244]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_dsc@dsc-with-formats.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][104] ([Intel XE#4141]) -> [SKIP][105] ([Intel XE#6703]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][106] ([Intel XE#2311]) -> [SKIP][107] ([Intel XE#6703]) +3 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][108] ([Intel XE#2313]) -> [SKIP][109] ([Intel XE#6703]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-bmg:          [SKIP][110] ([Intel XE#6886]) -> [SKIP][111] ([Intel XE#6703])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][112] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][113] ([Intel XE#1406] / [Intel XE#6703])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-bmg:          [SKIP][114] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][115] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][116] ([Intel XE#6503]) -> [SKIP][117] ([Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_sharpness_filter@filter-toggle.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][118] ([Intel XE#1729]) -> [SKIP][119] ([Intel XE#2426])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][120] ([Intel XE#1499]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          [SKIP][122] ([Intel XE#4837]) -> [SKIP][123] ([Intel XE#6703]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_eudebug@basic-vms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][124] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][125] ([Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:
    - shard-lnl:          [DMESG-WARN][126] ([Intel XE#4537] / [Intel XE#7063]) -> [DMESG-WARN][127] ([Intel XE#7063])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-5/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-7/igt@xe_exec_balancer@no-exec-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-bmg:          [SKIP][128] ([Intel XE#2322]) -> [SKIP][129] ([Intel XE#6703])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:
    - shard-bmg:          [SKIP][130] ([Intel XE#7136]) -> [SKIP][131] ([Intel XE#6703]) +2 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][132] ([Intel XE#6874]) -> [SKIP][133] ([Intel XE#6703]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_system_allocator@once-malloc-bo-unmap:
    - shard-lnl:          [DMESG-WARN][134] ([Intel XE#7063]) -> [DMESG-WARN][135] ([Intel XE#4537] / [Intel XE#7063])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-5/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-7/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:
    - shard-bmg:          [SKIP][136] ([Intel XE#4943]) -> [SKIP][137] ([Intel XE#6703])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-bmg:          [SKIP][138] ([Intel XE#7138]) -> [SKIP][139] ([Intel XE#6703])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          [SKIP][140] ([Intel XE#4733]) -> [SKIP][141] ([Intel XE#6703])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24 -> xe-pw-160717v1

  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24: 1d48b83aca95e25996b1a212f5d3035f38233a24
  xe-pw-160717v1: 160717v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/index.html

--===============2434697784885999745==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-160717v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-160717v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4455-1d48b83aca95e25996b1a212f5d3035f3=
8233a24_FULL -&gt; xe-pw-160717v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4455-1d48b83aca95e25996b1a212f=
5d3035f38233a24_FULL and xe-pw-160717v1_FULL:</p>
<h3>New IGT tests (7)</h3>
<ul>
<li>
<p>igt@xe_create@exec-queue-create-invalid-reserved:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@exec-queue-destroy-invalid-reserved:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-exec-queue-id:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-extensions:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-flag:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-len:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_create@invalid-pad:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-hang@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-hang@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-hang@pipe-a-edp-1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/igt@kms_flip=
@blocking-wf_vblank@a-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@kms_flip@blocking-w=
f_vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-c=
heck.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping@pipe=
-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_plane@pixel-format-4-til=
ed-bmg-ccs-modifier-source-clamping@pipe-b-plane-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131">Intel XE#7131=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_psr@pr-sprite-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_fault_mode@many-exec=
queues-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_multi_queue@many-que=
ues-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-8/igt@xe_exec_=
reset@gt-reset-stress.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-160717v1/shard-lnl-1/igt@xe_exec_reset@gt-reset-=
stress.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt0-threads:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_exec_=
reset@long-spin-many-preempt-gt0-threads.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_e=
xec_reset@long-spin-many-preempt-gt0-threads.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-huge-nomemset:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_exec_system_allocator@pro=
cess-many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
system_allocator@process-many-stride-malloc-prefetch-race.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/sha=
rd-bmg-2/igt@xe_exec_system_allocator@process-many-stride-malloc-prefetch-r=
ace.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703">Intel XE#6703</a>) +93 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-pref=
etch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16071=
7v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-execque=
ues-mmap-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-160717v1/shard-bmg-10/igt@xe_query@multigpu-query-pxp-=
status.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6=
078</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60717v1/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@kms_flip@=
2x-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shar=
d-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-=
10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/=
shard-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233=
a24/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f3=
8233a24/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d30=
35f38233a24/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f=
5d3035f38233a24/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a=
212f5d3035f38233a24/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e2599=
6b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e=
25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83ac=
a95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b=
83aca95e25996b1a212f5d3035f38233a24/shard-bmg-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4455-1=
d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-44=
55-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-4/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4455-1d48b83aca95e25996b1a212f5d3035f3823=
3a24/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-160717v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-160717v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-160717v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1=
/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160717v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-160717v1/shard-bmg-3/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160717v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1=
/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-160717v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_big_=
fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_=
big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_ccs@=
ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bm=
g-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6=
703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_chamel=
ium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_cham=
elium_frames@hdmi-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_=
chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_curs=
or_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg=
-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#670=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_dsc@=
dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1607=
17v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-160717v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
60717v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#688=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
717v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-fact=
or-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_psr2=
_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Inte=
l XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160717v1/shard-bmg-2/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-ar=
ea-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_psr@=
fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#285=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160=
717v1/shard-bmg-2/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_shar=
pness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_=
sharpness_filter@filter-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-10/igt@kms_til=
ed_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-1/igt@k=
ms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_eudeb=
ug@basic-vms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@xe_eudebug@basic-v=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_eudeb=
ug_online@pagefault-write.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-b=
mg-2/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-5/igt@xe_exec_=
balancer@no-exec-parallel-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">Intel XE#4537</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Inte=
l XE#7063</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-160717v1/shard-lnl-7/igt@xe_exec_balancer@no-exec-parallel-userptr-reb=
ind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/ig=
t@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-=
bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-imm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel =
XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v=
1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-malloc-bo-unmap:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-lnl-5/igt@xe_exec_=
system_allocator@once-malloc-bo-unmap.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/sha=
rd-lnl-7/igt@xe_exec_system_allocator@once-malloc-bo-unmap.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4537">=
Intel XE#4537</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-large-execqueues-mmap-huge.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE=
#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-160717v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execq=
ueues-mmap-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/s=
hard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24/shard-bmg-7/igt@xe_pxp@p=
xp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v1/shard-bmg-2/igt@x=
e_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24 -&gt; xe-pw-160=
717v1</li>
</ul>
<p>IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4455-1d48b83aca95e25996b1a212f5d3035f38233a24: 1d48b83aca95e25996b1a21=
2f5d3035f38233a24<br />
  xe-pw-160717v1: 160717v1</p>

</body>
</html>

--===============2434697784885999745==--
