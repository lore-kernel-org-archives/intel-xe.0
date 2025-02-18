Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2019C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 04:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A169D10E2C6;
	Tue, 18 Feb 2025 04:52:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1217110E2C6;
 Tue, 18 Feb 2025 04:52:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4396132975231522663=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dmc=3A_Test_Xe3LP?=
 =?utf-8?q?D_DMC_v2=2E17?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 04:52:44 -0000
Message-ID: <173985436406.3442418.10480970099837399792@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217144640.30606-1-gustavo.sousa@intel.com>
In-Reply-To: <20250217144640.30606-1-gustavo.sousa@intel.com>
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

--===============4396132975231522663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Test Xe3LPD DMC v2.17
URL   : https://patchwork.freedesktop.org/series/144961/
State : failure

== Summary ==

CI Bug Log - changes from xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95_full -> xe-pw-144961v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144961v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144961v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144961v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@universal-planes-dpms@plane-32:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html

  
#### Warnings ####

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][3] ([Intel XE#4268]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-4/igt@xe_pm@s4-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-9/igt@xe_pm@s4-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-144961v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5] ([Intel XE#1033]) +10 other tests dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#787]) +26 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#2907])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#306]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#373]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][12] -> [SKIP][13] ([Intel XE#309]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#455]) +6 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#310]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][17] -> [FAIL][18] ([Intel XE#301]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#3321])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3321])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][23] -> [DMESG-FAIL][24] ([Intel XE#1033])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][25] -> [FAIL][26] ([Intel XE#1874])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#656])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#656])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#651]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#653]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][32] -> [FAIL][33] ([Intel XE#616]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#2763]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2953])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1489])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1127])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#2883]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_setmode@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2905]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-bmg:          [PASS][44] -> [DMESG-WARN][45] ([Intel XE#4172]) +3 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][46] -> [DMESG-WARN][47] ([Intel XE#1033]) +10 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#288]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4173])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2541] / [Intel XE#3573])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@polling@ccs-0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][52] ([Intel XE#4172])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@xe_oa@polling@ccs-0.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][53] ([Intel XE#4268]) +3 other tests abort
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#944])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#3342])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-adlp:         [DMESG-WARN][56] -> [PASS][57] +3 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-2/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-9/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][58] ([Intel XE#3908]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-WARN][60] ([Intel XE#4172]) -> [PASS][61] +4 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][62] ([Intel XE#2705] / [Intel XE#4010]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#4010]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#3124] / [Intel XE#4010]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][68] ([Intel XE#3124] / [Intel XE#4010]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [DMESG-WARN][72] ([Intel XE#1033]) -> [PASS][73] +5 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_cdclk@mode-transition.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_cdclk@mode-transition.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][74] ([Intel XE#309]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][76] ([Intel XE#310]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][78] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][80] ([Intel XE#2049]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [SKIP][82] ([Intel XE#2316]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][84] ([Intel XE#301]) -> [PASS][85] +6 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp2:
    - shard-bmg:          [FAIL][86] ([Intel XE#3321]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][88] ([Intel XE#2882]) -> [PASS][89] +2 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][90] ([Intel XE#886]) -> [PASS][91] +4 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][92] ([Intel XE#1033]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][94] ([Intel XE#1874]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][96] ([Intel XE#656]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#2953]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][100] ([Intel XE#4173]) -> [PASS][101] +6 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  
#### Warnings ####

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#787]) -> [SKIP][103] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][104] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][105] ([Intel XE#787])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][106] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#4010]) -> [INCOMPLETE][107] ([Intel XE#4010])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][108] ([Intel XE#1033] / [Intel XE#3113] / [Intel XE#4010]) -> [INCOMPLETE][109] ([Intel XE#4010])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][110] ([Intel XE#3321]) -> [SKIP][111] ([Intel XE#2316])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#2049]) -> [DMESG-WARN][113] ([Intel XE#2955])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][114] ([Intel XE#310]) -> [DMESG-WARN][115] ([Intel XE#1033])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][116] ([Intel XE#2312]) -> [SKIP][117] ([Intel XE#2311]) +3 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#656]) -> [SKIP][119] ([Intel XE#651]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#1033]) -> [SKIP][121] ([Intel XE#656])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][122] ([Intel XE#4141]) -> [SKIP][123] ([Intel XE#2312]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][124] ([Intel XE#2312]) -> [SKIP][125] ([Intel XE#4141]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][126] ([Intel XE#2311]) -> [SKIP][127] ([Intel XE#2312]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#651]) -> [SKIP][129] ([Intel XE#656]) +7 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][130] ([Intel XE#2312]) -> [SKIP][131] ([Intel XE#2313]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#656]) -> [SKIP][133] ([Intel XE#653])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#653]) -> [SKIP][135] ([Intel XE#656]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][136] ([Intel XE#2313]) -> [SKIP][137] ([Intel XE#2312]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#4172]) -> [SKIP][139] ([Intel XE#1503])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-dg2-set2:     [DMESG-WARN][140] ([Intel XE#1033]) -> [SKIP][141] ([Intel XE#836])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][142] -> [DMESG-WARN][143] ([Intel XE#1033])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#1500]) -> [SKIP][145] ([Intel XE#362])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95 -> xe-pw-144961v1

  IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95: 2269ae390491a4d5ba7f0b86befde426a9eedd95
  xe-pw-144961v1: 144961v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/index.html

--===============4396132975231522663==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Test Xe3LPD DMC v2.17</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144961/">https://patchwork.freedesktop.org/series/144961/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95_full -&gt; xe-pw-144961v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144961v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144961v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144961v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pm_rpm@universal-planes-dpms@plane-32:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms@plane-32.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s4-basic:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144961v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@kms_pm_rpm@universal-planes-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@xe_eudebug_online@resume-dss.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@xe_oa@polling@ccs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-2/igt@kms_atomic_interruptible@universal-setplane-cursor.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-9/igt@kms_atomic_interruptible@universal-setplane-cursor.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_cdclk@mode-transition.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_cdclk@mode-transition.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank@c-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010">Intel XE#4010</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-463/igt@kms_flip@2x-flip-vs-panning-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_flip@2x-modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144961v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95 -&gt; xe-pw-144961v1</li>
</ul>
<p>IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2675-2269ae390491a4d5ba7f0b86befde426a9eedd95: 2269ae390491a4d5ba7f0b86befde426a9eedd95<br />
  xe-pw-144961v1: 144961v1</p>

</body>
</html>

--===============4396132975231522663==--
