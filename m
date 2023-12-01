Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA58C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 00:12:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E97B610E0BE;
	Fri,  1 Dec 2023 00:12:47 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id BA13F8905A;
 Fri,  1 Dec 2023 00:12:42 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 48990AADD5;
 Fri,  1 Dec 2023 00:12:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6757358169835407718=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 01 Dec 2023 00:12:42 -0000
Message-ID: <170138956228.19685.11675214407142131949@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130183955.7-1-francois.dugast@intel.com>
In-Reply-To: <20231130183955.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_Cleanup_and_future_proof_=28rev6=29?=
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

--===============6757358169835407718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof (rev6)
URL   : https://patchwork.freedesktop.org/series/126535/
State : failure

== Summary ==

CI Bug Log - changes from xe-541-68b673dd7ccbe64715e0a7492897e8d992040016_BAT -> xe-pw-126535v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126535v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126535v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126535v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_fault_mode@twice-basic:
    - bat-pvc-2:          [PASS][1] -> [SKIP][2] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - bat-pvc-2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-126535v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       [PASS][5] -> [WARN][6] ([Intel XE#978]) +7 other tests warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-adlp-7:         [PASS][7] -> [WARN][8] ([Intel XE#978]) +8 other tests warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_addfb_basic@too-wide.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_addfb_basic@too-wide.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#934]) +85 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html

  * igt@xe_create@create-massive-size:
    - bat-adlp-7:         [PASS][11] -> [FAIL][12] ([Intel XE#981])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_create@create-massive-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_create@create-massive-size.html
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] ([Intel XE#981])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_create@create-massive-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_create@create-massive-size.html
    - bat-atsm-2:         [PASS][15] -> [FAIL][16] ([Intel XE#981])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_create@create-massive-size.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_create@create-massive-size.html
    - bat-pvc-2:          [PASS][17] -> [FAIL][18] ([Intel XE#981])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_create@create-massive-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_create@create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][19] -> [SKIP][20] ([Intel XE#688]) +7 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-atsm-2:         [PASS][21] -> [SKIP][22] ([Intel XE#688]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [PASS][23] -> [SKIP][24] ([Intel XE#688]) +15 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-pvc-2:          [PASS][25] -> [FAIL][26] ([Intel XE#934]) +28 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][27] -> [FAIL][28] ([Intel XE#934]) +88 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][29] -> [FAIL][30] ([Intel XE#934]) +27 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][31] -> [CRASH][32] ([Intel XE#978])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
    - bat-dg2-oem2:       [PASS][33] -> [CRASH][34] ([Intel XE#978])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-atsm-2:         [PASS][35] -> [CRASH][36] ([Intel XE#978])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
    - bat-pvc-2:          [PASS][37] -> [CRASH][38] ([Intel XE#978])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@create-in-region.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][39] -> [FAIL][40] ([Intel XE#978]) +54 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][41] -> [FAIL][42] ([Intel XE#978]) +64 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_intel_bb@render@render-y-1024:
    - bat-pvc-2:          NOTRUN -> [FAIL][43] ([Intel XE#978]) +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html

  * igt@xe_live_ktest@dmabuf:
    - bat-dg2-oem2:       [PASS][44] -> [FAIL][45] ([Intel XE#980])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html
    - bat-pvc-2:          [PASS][46] -> [FAIL][47] ([Intel XE#980])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_live_ktest@dmabuf.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_live_ktest@dmabuf.html

  * igt@xe_mmap@system:
    - bat-atsm-2:         [PASS][48] -> [SKIP][49] ([Intel XE#263]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_mmap@system.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_mmap@system.html

  * igt@xe_mmap@vram:
    - bat-pvc-2:          [PASS][50] -> [SKIP][51] ([Intel XE#263]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_mmap@vram.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_mmap@vram.html
    - bat-dg2-oem2:       [PASS][52] -> [SKIP][53] ([Intel XE#263]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_mmap@vram.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_mmap@vram.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [PASS][54] -> [FAIL][55] ([Intel XE#978]) +62 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][56] -> [FAIL][57] ([Intel XE#978]) +61 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_query@query-engines:
    - bat-pvc-2:          [PASS][58] -> [WARN][59] ([Intel XE#985])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_query@query-engines.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_query@query-engines.html
    - bat-dg2-oem2:       [PASS][60] -> [WARN][61] ([Intel XE#985])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_query@query-engines.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_query@query-engines.html
    - bat-atsm-2:         [PASS][62] -> [WARN][63] ([Intel XE#985])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_query@query-engines.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [SKIP][64] ([Intel XE#388]) -> [FAIL][65] ([Intel XE#978]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-dg2-oem2:       [SKIP][66] ([Intel XE#388]) -> [FAIL][67] ([Intel XE#978]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][68] ([Intel XE#480]) -> [FAIL][69] ([Intel XE#934]) +1 other test fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][70] ([Intel XE#282] / [i915#2017]) -> [FAIL][71] ([Intel XE#978])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [FAIL][72] ([Intel XE#608]) -> [FAIL][73] ([Intel XE#978])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][74] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][75] ([Intel XE#934]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][76] ([Intel XE#482]) -> [SKIP][77] ([Intel XE#688]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][78] ([Intel XE#936]) -> [SKIP][79] ([Intel XE#688]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][80] ([Intel XE#532]) -> [FAIL][81] ([Intel XE#978])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@render.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/388
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/934
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [Intel XE#937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/937
  [Intel XE#978]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/978
  [Intel XE#980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/980
  [Intel XE#981]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/981
  [Intel XE#982]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/982
  [Intel XE#983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/983
  [Intel XE#984]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/984
  [Intel XE#985]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/985
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * IGT: IGT_7612 -> IGT_7613
  * Linux: xe-541-68b673dd7ccbe64715e0a7492897e8d992040016 -> xe-pw-126535v6

  IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016
  xe-pw-126535v6: 126535v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/index.html

--===============6757358169835407718==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126535/">https://patchwork.freedesktop.org/series/126535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-541-68b673dd7ccbe64715e0a7492897e8d992040016_BAT -&gt; xe-pw-126535v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126535v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126535v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126535v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-basic:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-basic.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126535v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_addfb_basic@too-wide.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +85 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-massive-size:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_create@create-massive-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_create@create-massive-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/981">Intel XE#981</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +28 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +88 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +54 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +64 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-y-1024:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_live_ktest@dmabuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/980">Intel XE#980</a>)</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_live_ktest@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_live_ktest@dmabuf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/980">Intel XE#980</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@system:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_mmap@system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_mmap@system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_mmap@vram.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_mmap@vram.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +62 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +61 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_query@query-engines.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/985">Intel XE#985</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@xe_query@query-engines.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/985">Intel XE#985</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-atsm-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-atsm-2/igt@xe_query@query-engines.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/985">Intel XE#985</a>)</p>
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
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +1 other test fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/388">Intel XE#388</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>) +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-541-68b673dd7ccbe64715e0a7492897e8d992040016/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v6/bat-pvc-2/igt@xe_intel_bb@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/978">Intel XE#978</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7612 -&gt; IGT_7613</li>
<li>Linux: xe-541-68b673dd7ccbe64715e0a7492897e8d992040016 -&gt; xe-pw-126535v6</li>
</ul>
<p>IGT_7612: b5c47966901ee1060bcb9d4bccdd3ccec9651ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-541-68b673dd7ccbe64715e0a7492897e8d992040016: 68b673dd7ccbe64715e0a7492897e8d992040016<br />
  xe-pw-126535v6: 126535v6</p>

</body>
</html>

--===============6757358169835407718==--
