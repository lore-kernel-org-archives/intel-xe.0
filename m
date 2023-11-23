Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32924C5AD4C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Nov 2023 15:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20B510E76C;
	Thu, 23 Nov 2023 15:01:08 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B583710E76C;
 Thu, 23 Nov 2023 15:01:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id AD31CAADEB;
 Thu, 23 Nov 2023 15:01:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0624851666143862935=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Thu, 23 Nov 2023 15:01:06 -0000
Message-ID: <170075166667.8138.2768435385250320798@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231122143833.7-1-francois.dugast@intel.com>
In-Reply-To: <20231122143833.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_Cleanup_and_future_proof_=28rev5=29?=
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

--===============0624851666143862935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Cleanup and future proof (rev5)
URL   : https://patchwork.freedesktop.org/series/126535/
State : failure

== Summary ==

CI Bug Log - changes from xe-517-501feae7afed8e9b21700d1185532c18d62ca33a_BAT -> xe-pw-126535v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126535v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126535v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126535v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-adlp-7:         [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][3] -> [WARN][4] +8 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] +18 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - bat-atsm-2:         [PASS][7] -> [SKIP][8] +18 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [PASS][9] -> [SKIP][10] +10 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][11] -> [CRASH][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][13] -> [CRASH][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
    - bat-atsm-2:         [PASS][15] -> [CRASH][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_intel_bb@create-in-region.html
    - bat-pvc-2:          [PASS][17] -> [CRASH][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@create-in-region.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][19] -> [FAIL][20] +63 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-dg2-oem2:       [PASS][21] -> [FAIL][22] +63 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_intel_bb@offset-control.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_intel_bb@offset-control.html
    - bat-adlp-7:         [PASS][23] -> [FAIL][24] +63 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_intel_bb@render@render-y-1024:
    - bat-pvc-2:          NOTRUN -> [FAIL][25] +5 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][26] -> [FAIL][27] +62 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  * igt@xe_query@query-engines:
    - bat-pvc-2:          [PASS][28] -> [WARN][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_query@query-engines.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_query@query-engines.html
    - bat-atsm-2:         [PASS][30] -> [WARN][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_query@query-engines.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][32] ([Intel XE#624]) -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][34] ([Intel XE#609]) -> [FAIL][35] +1 other test fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][36] ([Intel XE#609]) -> [FAIL][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][38] ([Intel XE#608]) -> [FAIL][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [FAIL][40] ([Intel XE#616] / [Intel XE#750]) -> [FAIL][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][42] ([Intel XE#936]) -> [SKIP][43] +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][44] ([Intel XE#482]) -> [SKIP][45] +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][46] ([Intel XE#532]) -> [FAIL][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@render.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@render.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-atsm-2:         [PASS][48] -> [SKIP][49] +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-pvc-2:          [INCOMPLETE][50] ([Intel XE#392]) -> [SKIP][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-overcommit-simple}:
    - bat-pvc-2:          [PASS][52] -> [SKIP][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-dg2-oem2:       [PASS][54] -> [SKIP][55] +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][56] -> [FAIL][57] +5 other tests fail
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][58] -> [FAIL][59] +5 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:
    - bat-pvc-2:          [PASS][60] -> [FAIL][61] +11 other tests fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][62] -> [FAIL][63] +5 other tests fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-126535v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-adlp-7:         [PASS][64] -> [FAIL][65] ([Intel XE#934]) +91 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-dg2-oem2:       [PASS][66] -> [FAIL][67] ([Intel XE#934]) +85 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][68] -> [FAIL][69] ([Intel XE#934]) +27 other tests fail
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-pvc-2:          [PASS][70] -> [FAIL][71] ([Intel XE#934]) +38 other tests fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][72] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][73] ([Intel XE#934]) +2 other tests fail
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/934
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [Intel XE#937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/937


Build changes
-------------

  * Linux: xe-517-501feae7afed8e9b21700d1185532c18d62ca33a -> xe-pw-126535v5

  IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-517-501feae7afed8e9b21700d1185532c18d62ca33a: 501feae7afed8e9b21700d1185532c18d62ca33a
  xe-pw-126535v5: 126535v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/index.html

--===============0624851666143862935==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Cleanup and future proof (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126535/">https://patchwork.freedesktop.org/series/126535/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-517-501feae7afed8e9b21700d1185532c18d62ca33a_BAT -&gt; xe-pw-126535v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126535v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126535v5_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126535v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_evict@evict-beng-small-multi-vm.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">CRASH</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">CRASH</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_intel_bb@create-in-region.html">CRASH</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@create-in-region.html">CRASH</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +63 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_intel_bb@offset-control.html">FAIL</a> +63 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +63 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-y-1024:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@render@render-y-1024.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +62 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_query@query-engines.html">WARN</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_query@query-engines.html">WARN</a></p>
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
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict@evict-small-cm.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_intel_bb@render.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-simple}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> +1 other test skip</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-rebind}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126535v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +91 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +85 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +27 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-pvc-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +38 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-517-501feae7afed8e9b21700d1185532c18d62ca33a/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126535v5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/934">Intel XE#934</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-517-501feae7afed8e9b21700d1185532c18d62ca33a -&gt; xe-pw-126535v5</li>
</ul>
<p>IGT_7598: 6be4fb999857e135d54a6643a57dfe394e9c6f2e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-517-501feae7afed8e9b21700d1185532c18d62ca33a: 501feae7afed8e9b21700d1185532c18d62ca33a<br />
  xe-pw-126535v5: 126535v5</p>

</body>
</html>

--===============0624851666143862935==--
