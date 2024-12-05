Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54193E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 20:32:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193A810E5CD;
	Thu,  5 Dec 2024 20:32:26 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE84710E5CD;
 Thu,  5 Dec 2024 20:32:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2024936358983701947=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_reg=5Fsr/whitelist_fixes_a?=
 =?utf-8?q?nd_refactors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 20:32:24 -0000
Message-ID: <173343074490.3072218.16106252849788396283@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205182240.3463027-1-lucas.demarchi@intel.com>
In-Reply-To: <20241205182240.3463027-1-lucas.demarchi@intel.com>
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

--===============2024936358983701947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: reg_sr/whitelist fixes and refactors
URL   : https://patchwork.freedesktop.org/series/142195/
State : failure

== Summary ==

CI Bug Log - changes from xe-2326-6148006e767be69293d1ec77dd127dba49db51dd_full -> xe-pw-142195v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142195v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142195v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142195v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-adlp:         [PASS][2] -> [INCOMPLETE][3] +1 other test incomplete
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-1/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_vm@compact-64k-pages:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] +13 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_vm@compact-64k-pages.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_vm@compact-64k-pages.html

  
#### Warnings ####

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][8] ([Intel XE#3468]) -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][10] ([Intel XE#2313]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256:
    - shard-bmg:          [DMESG-FAIL][12] ([Intel XE#3468]) -> [DMESG-FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][14] ([Intel XE#358]) -> [DMESG-FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@xe_exec_reset@cm-cat-error.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-4/igt@xe_exec_reset@cm-cat-error.html

  
Known issues
------------

  Here are the changes found in xe-pw-142195v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [PASS][16] -> [DMESG-FAIL][17] ([Intel XE#1033] / [Intel XE#1727]) +6 other tests dmesg-fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2887]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2325])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2252]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-adlp:         [PASS][22] -> [DMESG-WARN][23] ([Intel XE#2953] / [Intel XE#3086])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2320]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][25] ([Intel XE#3468]) +21 other tests dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2291]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2291])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2316])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][32] -> [FAIL][33] ([Intel XE#2882]) +2 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#886]) +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-5/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#2333])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311]) +4 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2313])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:
    - shard-bmg:          [PASS][39] -> [INCOMPLETE][40] ([Intel XE#2705] / [Intel XE#3468])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3468]) +14 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#1430]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-adlp:         [PASS][45] -> [DMESG-WARN][46] ([Intel XE#3086])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@kms_pm_rpm@basic-rte.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#756])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#1091] / [Intel XE#2849])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2905]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_exec_basic@many-basic-defer-bind:
    - shard-bmg:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2705] / [Intel XE#3468])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_exec_basic@many-basic-defer-bind.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_exec_basic@many-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2322]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#3605])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-6/igt@xe_exec_compute_mode@lr-mode-workload.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-bmg:          [PASS][57] -> [DMESG-WARN][58] ([Intel XE#1727])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][59] -> [DMESG-WARN][60] ([Intel XE#1727] / [Intel XE#3467])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2833])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_module_load@force-load:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2457])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87]) -> ([PASS][88], [PASS][89], [PASS][90], [SKIP][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113]) ([Intel XE#2457])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][114] -> [FAIL][115] ([Intel XE#2249]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2249]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@rcs-0.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-7/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          [PASS][118] -> [FAIL][119] ([Intel XE#2514]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
    - shard-bmg:          [PASS][120] -> [FAIL][121] ([Intel XE#2514]) +1 other test fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_oa@oa-regs-whitelisted@ccs-0.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2284])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][123] ([Intel XE#1727] / [Intel XE#3468])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#958])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#944])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-adlp:         [PASS][127] -> [FAIL][128] ([Intel XE#1081]) +1 other test fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-2/igt@xe_spin_batch@spin-fixed-duration.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][129] ([Intel XE#1701]) -> [PASS][130] +1 other test pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][131] ([Intel XE#877]) -> [PASS][132] +1 other test pass
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:
    - shard-lnl:          [FAIL][133] ([Intel XE#2577]) -> [PASS][134] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][135] ([Intel XE#2291]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:
    - shard-bmg:          [INCOMPLETE][137] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][139] ([Intel XE#2705] / [Intel XE#3468]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [SKIP][141] ([Intel XE#2316]) -> [PASS][142] +1 other test pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-bmg:          [FAIL][143] ([Intel XE#3098]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-4/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][147] ([Intel XE#2882]) -> [PASS][148] +2 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][149] ([Intel XE#3640]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [FAIL][151] ([Intel XE#3149] / [Intel XE#886]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][153] ([Intel XE#1503]) -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_mmap_write_crc@main@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][155] -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_mmap_write_crc@main@pipe-a-dp-2.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-bmg:          [DMESG-WARN][157] ([Intel XE#2566]) -> [PASS][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][159] ([Intel XE#2029]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][161] ([Intel XE#2883]) -> [PASS][162] +2 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-vram01-system:
    - shard-bmg:          [DMESG-WARN][163] -> [PASS][164] +10 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-vram01-system.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-vram01-system.html

  * igt@xe_exec_basic@many-rebind:
    - shard-bmg:          [DMESG-WARN][165] ([Intel XE#3468]) -> [PASS][166] +15 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_exec_basic@many-rebind.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_exec_basic@many-rebind.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][167] ([Intel XE#2705]) -> [PASS][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [DMESG-WARN][169] ([Intel XE#3086]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#3468]) -> [DMESG-FAIL][172] ([Intel XE#1727] / [Intel XE#3468])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [TIMEOUT][173] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][174] ([Intel XE#1231])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_color@ctm-negative@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][175] ([Intel XE#3468]) -> [DMESG-WARN][176] ([Intel XE#3468]) +4 other tests dmesg-warn
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_color@ctm-negative@pipe-a-dp-2.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_color@ctm-negative@pipe-a-dp-2.html

  * igt@kms_color@legacy-gamma:
    - shard-bmg:          [DMESG-WARN][177] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][178] ([Intel XE#3468])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_color@legacy-gamma.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_color@legacy-gamma.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][179] ([Intel XE#2291]) -> [DMESG-WARN][180] ([Intel XE#3468]) +1 other test dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [INCOMPLETE][181] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][182] ([Intel XE#3468])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:
    - shard-bmg:          [DMESG-WARN][183] ([Intel XE#3468]) -> [DMESG-FAIL][184] ([Intel XE#3468]) +1 other test dmesg-fail
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][185] ([Intel XE#2882]) -> [SKIP][186] ([Intel XE#2316])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][187] ([Intel XE#2316]) -> [DMESG-WARN][188] ([Intel XE#3468])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-FAIL][189] ([Intel XE#3468]) -> [DMESG-FAIL][190] ([Intel XE#2705] / [Intel XE#3468])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [SKIP][191] ([Intel XE#3665]) -> [DMESG-FAIL][192] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][193] ([Intel XE#2311]) -> [SKIP][194] ([Intel XE#2312]) +14 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [DMESG-FAIL][195] ([Intel XE#3468]) -> [INCOMPLETE][196] ([Intel XE#1727] / [Intel XE#2050]) +1 other test incomplete
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [FAIL][197] ([Intel XE#2333]) -> [SKIP][198] ([Intel XE#2312]) +5 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-rte:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [FAIL][200] ([Intel XE#2333]) +2 other tests fail
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-rte.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [DMESG-FAIL][201] ([Intel XE#3468]) -> [SKIP][202] ([Intel XE#2312]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][203] ([Intel XE#2312]) -> [SKIP][204] ([Intel XE#2311]) +9 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [SKIP][206] ([Intel XE#2313]) +10 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][207] ([Intel XE#2313]) -> [SKIP][208] ([Intel XE#2312]) +13 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#2705] / [Intel XE#3468]) -> [INCOMPLETE][210] ([Intel XE#2705] / [Intel XE#3468])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [DMESG-WARN][211] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][212] ([Intel XE#3468])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][213] ([Intel XE#1729]) -> [SKIP][214] ([Intel XE#2426])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-rpm:
    - shard-bmg:          [DMESG-WARN][215] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][216] ([Intel XE#1727] / [Intel XE#3468])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][217] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][218] ([Intel XE#3468])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2.html

  * igt@xe_ccs@block-copy-uncompressed:
    - shard-bmg:          [DMESG-WARN][219] -> [DMESG-WARN][220] ([Intel XE#3468])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [TIMEOUT][221] ([Intel XE#1473] / [Intel XE#2472]) -> [FAIL][222] ([Intel XE#1000])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_evict@evict-threads-large.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_evict@evict-threads-large.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#3467]) -> [DMESG-WARN][224] ([Intel XE#3467] / [Intel XE#3468])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [DMESG-WARN][225] ([Intel XE#3468]) -> [DMESG-WARN][226] ([Intel XE#1727] / [Intel XE#3468]) +2 other tests dmesg-warn
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-bmg:          [ABORT][227] ([Intel XE#3468] / [Intel XE#3673]) -> [DMESG-WARN][228] ([Intel XE#1727] / [Intel XE#3468])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_pm@s2idle-exec-after.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-bmg:          [ABORT][229] ([Intel XE#1616] / [Intel XE#3468]) -> [DMESG-FAIL][230] ([Intel XE#1727] / [Intel XE#3468])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_pm@s2idle-multiple-execs.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][231] ([Intel XE#2280] / [Intel XE#3468]) -> [DMESG-WARN][232] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_pm@s4-vm-bind-userptr.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-userptr.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#3605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3605
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#3665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3665
  [Intel XE#3673]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3673
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2326-6148006e767be69293d1ec77dd127dba49db51dd -> xe-pw-142195v1

  IGT_8138: 8138
  xe-2326-6148006e767be69293d1ec77dd127dba49db51dd: 6148006e767be69293d1ec77dd127dba49db51dd
  xe-pw-142195v1: 142195v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/index.html

--===============2024936358983701947==
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
<tr><td><b>Series:</b></td><td>reg_sr/whitelist fixes and refactors</td></t=
r>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142195/">https://patchwork.freedesktop.org/series/142195/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142195v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142195v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2326-6148006e767be69293d1ec77dd127dba4=
9db51dd_full -&gt; xe-pw-142195v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142195v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142195v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
95v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-180-hflip.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-1/igt@kms_cur=
sor_edge_walk@64x64-top-edge.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@kms_cursor_edge=
_walk@64x64-top-edge.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@sriov_b=
asic@enable-vfs-bind-unbind-each-numvfs-all.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@=
sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@compact-64k-pages:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_vm@co=
mpact-64k-pages.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_vm@compact-64k-pages.html"=
>DMESG-WARN</a> +13 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible@ab-dp2-hdmi-a3.=
html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1=
/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.ht=
ml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plan=
e_cursor@overlay@pipe-a-dp-2-size-256.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/sha=
rd-bmg-3/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-256.html">DMESG-FAIL=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@xe_exec=
_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-4/igt@xe_exe=
c_reset@cm-cat-error.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142195v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-2/igt@kms_asy=
nc_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@km=
s_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-yf-=
tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_chamelium_color@ctm-green=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-en=
able-disable-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-onscreen-256x85.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@kms_cursor_cr=
c@cursor-onscreen-256x85.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</=
li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscree=
n-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-ri=
ght-edge@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +21 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_cursor_=
legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/ig=
t@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2=
316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-6/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@kms_f=
lip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 ot=
her tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-5/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg=
-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-dp-2.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe=
_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_pipe_crc_basic=
@nonblocking-crc.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +14 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel X=
E#1430</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@kms_pm_=
rpm@basic-rte.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142195v1/shard-adlp-2/igt@kms_pm_rpm@basic-rte.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_psr@fbc-psr2-sprite-plane=
-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_writeback@writeback-inval=
id-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_eudebug_online@interrupt-a=
ll.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_exec_=
basic@many-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_exec_basic@man=
y-basic-defer-bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-6/igt@xe_exec=
_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-3/igt@xe_exec_compu=
te_mode@lr-mode-workload.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3605">Intel XE#3605</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_exec_=
reset@virtual-close-execqueues-close-fd.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_ex=
ec_reset@virtual-close-execqueues-close-fd.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/sh=
ard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_=
ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/sha=
rd-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db=
51dd/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba=
49db51dd/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd12=
7dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77=
dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1=
ec77dd127dba49db51dd/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767be692=
93d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e767b=
e69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148006e=
767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-6148=
006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2326-=
6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_module_load@load.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142195v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_oa@mm=
io-triggered-reports.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_oa@mmio-triggered-rep=
orts.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@xe_oa@mm=
io-triggered-reports@rcs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-7/igt@xe_oa@mmio-trigger=
ed-reports@rcs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2249">Intel XE#2249</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-4/igt@xe_oa@oa=
-regs-whitelisted@ccs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-3/igt@xe_oa@oa-regs-whiteli=
sted@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_oa@oa=
-regs-whitelisted@ccs-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@xe_oa@oa-regs-whiteli=
sted@ccs-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">I=
ntel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@xe_pm@s4-basic-exec.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-5/igt@xe_pm_re=
sidency@toggle-gt-c6.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-7/igt@xe_pm_residency@toggle-g=
t-c6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-2/igt@xe_spin=
_batch@spin-fixed-duration.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@xe_spin_batch@spi=
n-fixed-duration.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1081">Intel XE#1081</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@kms_atom=
ic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#=
1701</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142195v1/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocki=
ng@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_colo=
r@legacy-gamma@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/=
igt@kms_color@legacy-gamma@pipe-d-hdmi-a-3.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-7/igt@kms_curs=
or_edge_walk@256x256-left-edge@pipe-a-edp-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/sha=
rd-lnl-5/igt@kms_cursor_edge_walk@256x256-left-edge@pipe-a-edp-1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-b=
mg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt@rgb565-4tiled.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3=
468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-4tiled.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE=
#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142195v1/shard-bmg-3/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_flip=
@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_fli=
p@2x-dpms-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_flip=
@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_fl=
ip@basic-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-4/igt@kms_fli=
p@flip-vs-dpms-off-vs-modeset-interruptible@a-hdmi-a1.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@kms_flip@flip-vs-dpms-off-vs-mo=
deset-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg=
-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/sha=
rd-bmg-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_flip=
@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shar=
d-lnl-8/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-1/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_mmap_write_crc@main@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@kms_mmap=
_write_crc@main@pipe-a-dp-2.html">INCOMPLETE</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@kms_mmap_wr=
ite_crc@main@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-unity-scaling.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel =
XE#2566</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142195v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-=
unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-8/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-lnl-8/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed@linear-uncompressed-compfmt0-vram01-s=
ystem:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_ccs@b=
lock-copy-uncompressed@linear-uncompressed-compfmt0-vram01-system.html">DME=
SG-WARN</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142195v1/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed@linear-uncompress=
ed-compfmt0-vram01-system.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_exec_=
basic@many-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/igt@xe_exec=
_basic@many-rebind.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_exec_=
threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-8/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">=
Intel XE#3086</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142195v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-fu=
nction-xe_tile_init_early.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#34=
68</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2195v1/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hf=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-adlp-4/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">In=
tel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-adlp-6/igt@kms_big_fb@x-til=
ed-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_colo=
r@ctm-negative@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/ig=
t@kms_color@ctm-negative@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_colo=
r@legacy-gamma.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/ig=
t@kms_color@legacy-gamma.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-b=
mg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-=
bmg-3/igt@kms_draw_crc@draw-method-blt.html">DMESG-FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@rgb565-xtiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_draw=
_crc@draw-method-blt@rgb565-xtiled.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-=
bmg-3/igt@kms_draw_crc@draw-method-blt@rgb565-xtiled.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel =
XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_flip=
@2x-plain-flip-ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-3/igt@kms_fli=
p@2x-plain-flip-ts-check.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3665">Intel XE#3665</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/s=
hard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-142195v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-=
shrfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-8/igt@kms=
_frontbuffer_tracking@fbc-2p-rte.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">DMESG-FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#=
3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142195v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel =
XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142195v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
95v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@kms_pipe=
_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142195v1/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv1=
2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_plan=
e_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v=
1/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-7/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_vbla=
nk@ts-continuation-dpms-rpm.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1=
/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@kms_vbla=
nk@ts-continuation-dpms-rpm@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel=
 XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142195v1/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-dp-=
2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_ccs@b=
lock-copy-uncompressed.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_ccs@block-cop=
y-uncompressed.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-1/igt@xe_evict=
@evict-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg=
-2/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#=
3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142195v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_=
wa_init.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_gt_fr=
eq@freq_suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-4/igt@xe_gt_fre=
q@freq_suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-3/igt@xe_pm@s2=
idle-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3673">Intel XE#3673</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-2/ig=
t@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-8/igt@xe_pm@s2=
idle-multiple-execs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-5/=
igt@xe_pm@s2idle-multiple-execs.html">DMESG-FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2326-6148006e767be69293d1ec77dd127dba49db51dd/shard-bmg-4/igt@xe_pm@s4=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142195v1/shard-bmg-=
3/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468"=
>Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2326-6148006e767be69293d1ec77dd127dba49db51dd -&gt; xe-pw-142=
195v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2326-6148006e767be69293d1ec77dd127dba49db51dd: 6148006e767be69293d1ec7=
7dd127dba49db51dd<br />
  xe-pw-142195v1: 142195v1</p>

</body>
</html>

--===============2024936358983701947==--
