Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3B9C531DD
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 14:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF3610E4A6;
	Wed, 14 Aug 2024 14:24:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2492E10E4A6;
 Wed, 14 Aug 2024 14:24:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6813435865925735944=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_remove_GuC_reload_in_?=
 =?utf-8?q?D3Hot_path_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 14:24:41 -0000
Message-ID: <172364548113.632575.12917920162655593606@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814105919.2408428-1-riana.tauro@intel.com>
In-Reply-To: <20240814105919.2408428-1-riana.tauro@intel.com>
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

--===============6813435865925735944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: remove GuC reload in D3Hot path (rev7)
URL   : https://patchwork.freedesktop.org/series/135265/
State : failure

== Summary ==

CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_full -> xe-pw-135265v7_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135265v7_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135265v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135265v7_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][7] -> [INCOMPLETE][8] +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p:
    - shard-dg2-set2:     [PASS][9] -> [TIMEOUT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p.html

  
#### Warnings ####

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#1201]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_oa@invalid-create-userspace-config.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][13] ([Intel XE#1173]) -> [TIMEOUT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_peer2peer@read.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][15] ([Intel XE#569]) -> [DMESG-FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@atomic:
    - {shard-bmg}:        [FAIL][17] ([Intel XE#1178]) -> [INCOMPLETE][18] +1 other test incomplete
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-2/igt@kms_content_protection@atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:
    - {shard-bmg}:        [PASS][19] -> [INCOMPLETE][20] +3 other tests incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][21]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - {shard-bmg}:        [PASS][22] -> [DMESG-WARN][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-4/igt@xe_pm@s4-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-135265v7_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-lnl:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#2317])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1705])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1659])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#2191])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_hpd@dp-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#309])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][37] -> [FAIL][38] ([Intel XE#886]) +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - shard-adlp:         NOTRUN -> [FAIL][42] ([Intel XE#1874]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1874])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][45] -> [DMESG-WARN][46] ([Intel XE#2042])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#771] / [Intel XE#899])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#899]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1123] / [Intel XE#1201])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_evict@evict-large:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#688])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@xe_evict@evict-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][56] -> [INCOMPLETE][57] ([Intel XE#1195]) +9 other tests incomplete
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_threads@threads-bal-mixed-rebind:
    - shard-adlp:         [PASS][59] -> [INCOMPLETE][60] ([Intel XE#1169] / [Intel XE#1195])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-rebind.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-rebind.html

  * igt@xe_pm@s2idle-mocs:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#2028])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@xe_pm@s2idle-mocs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][63] -> [ABORT][64] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#1794])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][68] ([Intel XE#1033]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][70] ([Intel XE#1701]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][72] ([Intel XE#1659]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [FAIL][74] ([Intel XE#1901] / [Intel XE#2028]) -> [PASS][75] +3 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-3/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][76] ([Intel XE#886]) -> [PASS][77] +2 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][78] ([Intel XE#1503]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - {shard-bmg}:        [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81] +7 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][82] ([Intel XE#324]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][84] ([Intel XE#1874]) -> [PASS][85]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html

  * igt@kms_sequence@queue-idle:
    - shard-adlp:         [DMESG-WARN][86] ([Intel XE#1638]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-6/igt@kms_sequence@queue-idle.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-4/igt@kms_sequence@queue-idle.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][88] ([Intel XE#771] / [Intel XE#899]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][90] ([Intel XE#899]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][92] ([Intel XE#899]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][94] ([Intel XE#1041] / [Intel XE#1473]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][96] ([Intel XE#1473]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][98] ([Intel XE#1473]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - {shard-bmg}:        [TIMEOUT][100] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@xe_evict@evict-threads-large.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-4/igt@xe_evict@evict-threads-large.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [FAIL][102] ([Intel XE#2028]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@xe_pm@s2idle-basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-4/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][104] ([Intel XE#1794]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][106] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [ABORT][108] ([Intel XE#1607] / [Intel XE#1794]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][110] ([Intel XE#316]) -> [SKIP][111] ([Intel XE#1201] / [Intel XE#316])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][113] ([Intel XE#316]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][115] ([Intel XE#1124]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#1124]) -> [SKIP][117] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][119] ([Intel XE#346])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_big_joiner@basic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_joiner@basic.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#367]) -> [SKIP][121] ([Intel XE#1201] / [Intel XE#367]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][123] ([Intel XE#367]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][125] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][127] ([Intel XE#787]) +48 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][129] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#787]) -> [SKIP][131] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][133] ([Intel XE#1152]) +3 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][135] ([Intel XE#373]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#373]) -> [SKIP][137] ([Intel XE#1201] / [Intel XE#373]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#308]) -> [SKIP][139] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][141] ([Intel XE#308]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][143] ([Intel XE#323])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][145] ([Intel XE#455]) +7 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][147] ([Intel XE#776])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][149] ([Intel XE#1135])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][150] ([Intel XE#2019]) -> [INCOMPLETE][151] ([Intel XE#1195] / [Intel XE#2019])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#2019]) -> [DMESG-FAIL][153] ([Intel XE#2019]) +1 other test dmesg-fail
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][154] ([Intel XE#1551]) -> [INCOMPLETE][155] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) +1 other test incomplete
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][156] ([Intel XE#1551]) -> [DMESG-FAIL][157] ([Intel XE#1551]) +1 other test dmesg-fail
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#455]) -> [SKIP][159] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][160] ([i915#5274]) -> [SKIP][161] ([Intel XE#1201] / [i915#5274])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#651]) -> [SKIP][163] ([Intel XE#1201] / [Intel XE#651]) +16 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][165] ([Intel XE#651]) +10 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][167] ([Intel XE#653]) +11 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#653]) -> [SKIP][169] ([Intel XE#1201] / [Intel XE#653]) +11 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [DMESG-WARN][170] ([Intel XE#1162]) -> [INCOMPLETE][171] ([Intel XE#1162] / [Intel XE#1195])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][173] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][175] ([Intel XE#498]) +2 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1489]) -> [SKIP][177] ([Intel XE#1201] / [Intel XE#1489])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][179] ([Intel XE#1489])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#1122]) -> [SKIP][181] ([Intel XE#1122] / [Intel XE#1201]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-cursor-render:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][183] ([Intel XE#929]) +6 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-render.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#929]) -> [SKIP][185] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#327]) -> [SKIP][187] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#1127]) -> [SKIP][189] ([Intel XE#1127] / [Intel XE#1201])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#2019]) -> [INCOMPLETE][191] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#2019]) +1 other test incomplete
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][193] ([Intel XE#2168])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_vrr@cmrr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_vrr@cmrr.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#756]) -> [SKIP][195] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][197] ([Intel XE#1091])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][199] ([Intel XE#1126])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][201] ([Intel XE#288]) +9 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#288]) -> [SKIP][203] ([Intel XE#1201] / [Intel XE#288]) +12 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][204] -> [SKIP][205] ([Intel XE#1201]) +4 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][207] ([Intel XE#979])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][209] ([Intel XE#2284] / [Intel XE#366])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_pm@d3cold-basic.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][212] ([Intel XE#1551] / [Intel XE#569]) -> [DMESG-FAIL][213] ([Intel XE#1551]) +3 other tests dmesg-fail
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][214] ([Intel XE#1162] / [Intel XE#1941] / [Intel XE#569]) -> [DMESG-FAIL][215] ([Intel XE#1162])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#579]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#579])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#944]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_query@multigpu-query-engines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -> xe-pw-135265v7

  IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6
  xe-pw-135265v7: 135265v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/index.html

--===============6813435865925735944==
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
<tr><td><b>Series:</b></td><td>drm/xe: remove GuC reload in D3Hot path (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135265/">https://patchwork.freedesktop.org/series/135265/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_full -&gt; xe-pw-135265v7_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135265v7_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135265v7_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135265v7_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-edp-1.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_psr@fbc-psr2-suspend.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-system-gpub-system-p2p.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@xe_peer2peer@read.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-3/igt@kms_content_protection@atomic.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-5/igt@xe_exec_balancer@many-cm-parallel-userptr-invalidate.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-4/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135265v7_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-8/igt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2317">Intel XE#2317</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_chamelium_hpd@dp-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +9 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-6/igt@xe_exec_threads@threads-bal-mixed-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-4/igt@xe_exec_threads@threads-bal-mixed-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@xe_pm@s2idle-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@xe_pm@s2idle-mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1901">Intel XE#1901</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-3/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_plane_lowres@tiling-x@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-6/igt@kms_sequence@queue-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-4/igt@kms_sequence@queue-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-6/igt@xe_evict@evict-cm-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-bmg-4/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@xe_pm@s2idle-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-4/igt@xe_pm@s2idle-basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-lnl-5/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-2/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-adlp-1/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a6-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-463/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@s3-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-466/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135265v7/shard-dg2-463/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -&gt; xe-pw-135265v7</li>
</ul>
<p>IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6<br />
  xe-pw-135265v7: 135265v7</p>

</body>
</html>

--===============6813435865925735944==--
