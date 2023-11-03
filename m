Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16AAC4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 15:24:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244F10E002;
	Fri,  3 Nov 2023 15:24:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEE4810E002;
 Fri,  3 Nov 2023 15:24:11 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EA23EA03D2;
 Fri,  3 Nov 2023 15:24:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5184609474253097500=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 03 Nov 2023 15:24:11 -0000
Message-ID: <169902505195.29107.10468160192193724703@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103143456.7-1-francois.dugast@intel.com>
In-Reply-To: <20231103143456.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_take_2?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============5184609474253097500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 2
URL   : https://patchwork.freedesktop.org/series/125955/
State : failure

== Summary ==

CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -> xe-pw-125955v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125955v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125955v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125955v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once:
    - bat-pvc-2:          [PASS][1] -> [FAIL][2] +14 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +127 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          NOTRUN -> [FAIL][5] +183 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] +208 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +168 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#609]) -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][11] ([i915#6077]) -> [FAIL][12] +33 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         [SKIP][13] ([Intel XE#782]) -> [FAIL][14] +5 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][15] ([Intel XE#784]) -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][17] ([Intel XE#423]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][19] ([Intel XE#541]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][21] ([Intel XE#540]) -> [FAIL][22] +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][23] ([Intel XE#282] / [i915#2017]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         [SKIP][25] ([Intel XE#783]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         [SKIP][27] ([i915#1836]) -> [FAIL][28] +6 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][29] ([Intel XE#780]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_prop_blob@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         [SKIP][31] ([Intel XE#535]) -> [FAIL][32] +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         [SKIP][33] ([Intel XE#672]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_compute@compute-square.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][35] ([Intel XE#389]) -> [FAIL][36] +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
    - bat-adlp-7:         [SKIP][37] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][38] +15 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][39] ([Intel XE#482]) -> [FAIL][40] +3 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][41] ([Intel XE#288]) -> [FAIL][42] +17 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         [SKIP][43] ([Intel XE#255]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][45] ([Intel XE#263]) -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_mmap@vram.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_mmap@vram.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][47] ([Intel XE#524]) -> [FAIL][48] +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][49] ([Intel XE#524]) -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][51] ([Intel XE#854]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
    - bat-adlp-7:         [SKIP][53] ([Intel XE#688]) -> [FAIL][54] +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][55] -> [FAIL][56] +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][57] -> [FAIL][58] +14 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          NOTRUN -> [FAIL][59] +27 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][60] +31 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [SKIP][61] ([Intel XE#288]) -> [FAIL][62] +14 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][63] -> [FAIL][64] +13 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7570 -> IGT_7573
  * Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -> xe-pw-125955v1

  IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2
  xe-pw-125955v1: 125955v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/index.html

--===============5184609474253097500==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125955/">https://patchwork.freedesktop.org/series/125955/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -&gt; xe-pw-125955v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125955v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125955v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125955v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_dma_buf_sync@export-dma-buf-once.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +127 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> +183 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +208 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +168 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_compute@compute-square.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +15 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/854">Intel XE#854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +27 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +31 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125955v1/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7570 -&gt; IGT_7573</li>
<li>Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -&gt; xe-pw-125955v1</li>
</ul>
<p>IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2<br />
  xe-pw-125955v1: 125955v1</p>

</body>
</html>

--===============5184609474253097500==--
