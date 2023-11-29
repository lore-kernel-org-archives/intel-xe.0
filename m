Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF0BC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 22:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A1510E69A;
	Wed, 29 Nov 2023 22:49:50 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14CE710E69A;
 Wed, 29 Nov 2023 22:49:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0C8C2AADDD;
 Wed, 29 Nov 2023 22:49:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7738923576139647778=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Date: Wed, 29 Nov 2023 22:49:49 -0000
Message-ID: <170129818901.12092.7139817455542753208@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231129214509.1174116-1-michal.winiarski@intel.com>
In-Reply-To: <20231129214509.1174116-1-michal.winiarski@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_st?=
 =?utf-8?q?arting_with_=5BCI=2C01/14=5D_drm/xe=3A_Fix_header_guard_warning?=
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

--===============7738923576139647778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,01/14] drm/xe: Fix header guard warning
URL   : https://patchwork.freedesktop.org/series/127083/
State : success

== Summary ==

CI Bug Log - changes from xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668_BAT -> xe-pw-127083v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-127083v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +17 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [WARN][2] -> [PASS][3] +8 other tests pass
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-adlp-7:         [WARN][4] -> [PASS][5] +8 other tests pass
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_addfb_basic@too-wide.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_addfb_basic@too-wide.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [FAIL][6] ([Intel XE#934]) -> [PASS][7] +91 other tests pass
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [WARN][8] ([Intel XE#937]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
    - bat-adlp-7:         [WARN][10] ([Intel XE#937]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-pvc-2:          [WARN][12] ([Intel XE#937]) -> [PASS][13] +1 other test pass
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
    - bat-dg2-oem2:       [WARN][14] ([Intel XE#937]) -> [PASS][15] +1 other test pass
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [SKIP][16] -> [PASS][17] +20 other tests pass
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-pvc-2:          [FAIL][18] ([Intel XE#934]) -> [PASS][19] +34 other tests pass
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [FAIL][20] ([Intel XE#934]) -> [PASS][21] +102 other tests pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [FAIL][22] ([Intel XE#934]) -> [PASS][23] +33 other tests pass
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [CRASH][24] -> [PASS][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
    - bat-dg2-oem2:       [CRASH][26] -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-atsm-2:         [CRASH][28] -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
    - bat-pvc-2:          [CRASH][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@create-in-region.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [FAIL][32] -> [PASS][33] +69 other tests pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [FAIL][34] -> [PASS][35] +77 other tests pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_mmap@system:
    - bat-atsm-2:         [SKIP][36] -> [PASS][37] +20 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_mmap@system.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_mmap@system.html

  * igt@xe_mmap@vram:
    - bat-pvc-2:          [SKIP][38] -> [PASS][39] +11 other tests pass
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_mmap@vram.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_mmap@vram.html

  * {igt@xe_pat@pat-index-xehpc}:
    - bat-pvc-2:          [INCOMPLETE][40] -> [PASS][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html

  * {igt@xe_pat@pat-index-xelp}:
    - bat-adlp-7:         [INCOMPLETE][42] -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_pat@pat-index-xelp.html
    - bat-dg2-oem2:       [INCOMPLETE][44] -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html
    - bat-atsm-2:         [INCOMPLETE][46] -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_pat@pat-index-xelp.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [FAIL][48] -> [PASS][49] +77 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [FAIL][50] -> [PASS][51] +74 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_query@query-engines:
    - bat-pvc-2:          [WARN][52] -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_query@query-engines.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_query@query-engines.html
    - bat-atsm-2:         [WARN][54] -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_query@query-engines.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][56] -> [SKIP][57] ([Intel XE#388]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [FAIL][58] -> [SKIP][59] ([Intel XE#388]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][60] -> [DMESG-FAIL][61] ([Intel XE#282] / [i915#2017])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][62] -> [FAIL][63] ([Intel XE#608])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][64] ([Intel XE#934]) -> [FAIL][65] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [SKIP][66] -> [DMESG-FAIL][67] ([Intel XE#482]) +3 other tests dmesg-fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [SKIP][68] -> [FAIL][69] ([Intel XE#936]) +3 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [FAIL][70] -> [SKIP][71] ([Intel XE#532])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@render.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/934
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [Intel XE#937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/937
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668 -> xe-pw-127083v1

  IGT_7610: 7610
  xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668: 7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668
  xe-pw-127083v1: 127083v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/index.html

--===============7738923576139647778==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,01/14] drm/xe: Fix header guard warning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127083/">https://patchwork.freedesktop.org/series/127083/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668_BAT -&gt; xe-pw-127083v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127083v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_addfb_basic@too-wide.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_addfb_basic@too-wide.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> +91 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/937">Intel XE#937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/937">Intel XE#937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/937">Intel XE#937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/937">Intel XE#937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a> +34 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> +102 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> +69 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_mmap@system.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_mmap@system.html">PASS</a> +20 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_mmap@vram.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_mmap@vram.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xehpc}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pat@pat-index-xelp}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@xe_pat@pat-index-xelp.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelp.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_pat@pat-index-xelp.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> +74 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_query@query-engines.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_query@query-engines.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-atsm-2/igt@xe_query@query-engines.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-atsm-2/igt@xe_query@query-engines.html">PASS</a></p>
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
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +1 other test skip</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668/bat-pvc-2/igt@xe_intel_bb@render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127083v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668 -&gt; xe-pw-127083v1</li>
</ul>
<p>IGT_7610: 7610<br />
  xe-536-7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668: 7e3babd5b0a73eb7bc4dd5966b31c5ad960d0668<br />
  xe-pw-127083v1: 127083v1</p>

</body>
</html>

--===============7738923576139647778==--
