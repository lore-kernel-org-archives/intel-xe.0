Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349D6C2BB3F
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 03:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B90810E02A;
	Sat, 18 Nov 2023 03:59:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFD0210E02A;
 Sat, 18 Nov 2023 03:59:19 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A87A1A7E03;
 Sat, 18 Nov 2023 03:59:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4500552203714543504=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Sat, 18 Nov 2023 03:59:19 -0000
Message-ID: <170027995965.12899.11549554819144320586@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231116144316.7-1-francois.dugast@intel.com>
In-Reply-To: <20231116144316.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_Cleanup_and_future_proof?=
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

--===============4500552203714543504==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof
URL   : https://patchwork.freedesktop.org/series/126535/
State : failure

== Summary ==

CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -> xe-pw-126535v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126535v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126535v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126535v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-adlp-7:         [PASS][3] -> [WARN][4] +8 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@too-high.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_addfb_basic@too-high.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] +108 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [PASS][7] -> [TIMEOUT][8] +1 other test timeout
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
    - bat-pvc-2:          [PASS][9] -> [TIMEOUT][10] +1 other test timeout
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +167 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * {igt@xe_intel_bb@create-in-region@region-vram10} (NEW):
    - bat-dg2-oem2:       NOTRUN -> [FAIL][13] +7 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram10.html

  * {igt@xe_intel_bb@create-in-region@region-vram12} (NEW):
    - bat-adlp-7:         NOTRUN -> [FAIL][14] +7 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_intel_bb@create-in-region@region-vram12.html

  * {igt@xe_intel_bb@create-in-region@region-vram23} (NEW):
    - bat-atsm-2:         NOTRUN -> [FAIL][15] +7 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram23.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][16] -> [FAIL][17] +110 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][18] -> [FAIL][19] +154 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_intel_bb@render@render-y-1024:
    - bat-pvc-2:          NOTRUN -> [FAIL][20] +17 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html

  * igt@xe_mmap@system:
    - bat-atsm-2:         [PASS][21] -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_mmap@system.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_mmap@system.html
    - bat-pvc-2:          [PASS][23] -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_mmap@system.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_mmap@system.html
    - bat-dg2-oem2:       [PASS][25] -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_mmap@system.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_mmap@system.html

  * igt@xe_query@query-engines:
    - bat-pvc-2:          [PASS][27] -> [WARN][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_query@query-engines.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_query@query-engines.html
    - bat-atsm-2:         [PASS][29] -> [WARN][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_query@query-engines.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][31] ([Intel XE#609]) -> [FAIL][32] +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [SKIP][33] ([Intel XE#624]) -> [FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][35] ([Intel XE#609]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][37] ([Intel XE#282] / [i915#2017]) -> [FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][39] ([Intel XE#608]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][41] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][42] +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][43] ([Intel XE#482]) -> [FAIL][44] +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][45] ([Intel XE#532]) -> [FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_intel_bb@render.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_psr@psr_cursor_plane_move}:
    - bat-adlp-7:         [PASS][47] -> [FAIL][48] +17 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-pvc-2:          [PASS][49] -> [WARN][50] +1 other test warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_create@create-execqueues-leak.html
    - bat-adlp-7:         [PASS][51] -> [WARN][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][53] ([Intel XE#524]) -> [WARN][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][55] ([Intel XE#392]) -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind}:
    - bat-dg2-oem2:       [PASS][57] -> [FAIL][58] +13 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][59] -> [FAIL][60] +13 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][61] -> [FAIL][62] +27 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  
New tests
---------

  New tests have been introduced between xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT and xe-pw-126535v1_BAT:

### New IGT tests (14) ###

  * igt@xe_intel_bb@create-in-region@region-vram10:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram11:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram12:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram13:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram14:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram16:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram17:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram18:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram19:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram20:
    - Statuses : 4 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram22:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram23:
    - Statuses : 3 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram4:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  * igt@xe_intel_bb@create-in-region@region-vram9:
    - Statuses : 1 fail(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-126535v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [PASS][63] -> [INCOMPLETE][64] ([Intel XE#764])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][65] ([Intel XE#524]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -> xe-pw-126535v1

  IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2
  xe-pw-126535v1: 126535v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/index.html

--===============4500552203714543504==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126535/">https://patchwork.freedesktop.org/series/126535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT -&gt; xe-pw-126535v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126535v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126535v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126535v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_addfb_basic@too-high.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +108 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">TIMEOUT</a> +1 other test timeout</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">TIMEOUT</a> +1 other test timeout</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +167 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@create-in-region@region-vram10} (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region@region-vram10.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@create-in-region@region-vram12} (NEW):</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_intel_bb@create-in-region@region-vram12.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_intel_bb@create-in-region@region-vram23} (NEW):</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_intel_bb@create-in-region@region-vram23.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +110 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +154 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-y-1024:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_mmap@system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_mmap@system.html">SKIP</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_mmap@system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_mmap@system.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_mmap@system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_mmap@system.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_query@query-engines.html">WARN</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_query@query-engines.html">WARN</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_intel_bb@render.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_psr@psr_cursor_plane_move}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@kms_psr@psr_cursor_plane_move.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_create@create-execqueues-leak.html">WARN</a> +1 other test warn</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">WARN</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">WARN</a></li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-dg2-oem2/igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +27 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-504-cb9b702d436952ddec33b020d549c7998cace9e2_BAT and xe-pw-126535v1_BAT:</p>
<h3>New IGT tests (14)</h3>
<ul>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram10:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram11:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram12:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram13:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram14:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram16:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram17:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram18:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram19:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram20:</p>
<ul>
<li>Statuses : 4 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram22:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram23:</p>
<ul>
<li>Statuses : 3 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-vram9:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126535v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-leak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-504-cb9b702d436952ddec33b020d549c7998cace9e2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-504-cb9b702d436952ddec33b020d549c7998cace9e2 -&gt; xe-pw-126535v1</li>
</ul>
<p>IGT_7594: 8478eefdaa3eef02b4370339ef0d1970d44a67a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-504-cb9b702d436952ddec33b020d549c7998cace9e2: cb9b702d436952ddec33b020d549c7998cace9e2<br />
  xe-pw-126535v1: 126535v1</p>

</body>
</html>

--===============4500552203714543504==--
