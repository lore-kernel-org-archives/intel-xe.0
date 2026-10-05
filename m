Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D1FCA5FF5
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 20:05:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DC210E1B0;
	Mon,  5 Oct 2026 20:05:12 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA08789D39;
 Mon,  5 Oct 2026 20:05:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2693475045431746922=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Add_new_debug_infrastructur?=
 =?utf-8?q?e_for_configfs_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Oct 2026 20:05:11 -0000
Message-ID: <179123071168.241523.12089369122395596079@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261005190611.332940-17-stuart.summers@intel.com>
In-Reply-To: <20261005190611.332940-17-stuart.summers@intel.com>
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

--===============2693475045431746922==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add new debug infrastructure for configfs (rev9)
URL   : https://patchwork.freedesktop.org/series/165879/
State : failure

== Summary ==

CI Bug Log - changes from xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b_BAT -> xe-pw-165879v9_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165879v9_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165879v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 13)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165879v9_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-nvls-2:         [PASS][1] -> [SKIP][2] +221 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-bmg-1:          [PASS][3] -> [SKIP][4] +270 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-ptl-2:          [PASS][5] -> [SKIP][6] +240 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - bat-lnl-1:          [PASS][7] -> [SKIP][8] +232 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-ptl-1:          [PASS][9] -> [SKIP][10] +222 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [PASS][11] -> [SKIP][12] +184 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][13] -> [SKIP][14] +252 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-nvls-1:         [PASS][15] -> [SKIP][16] +241 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][17] -> [SKIP][18] +185 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-atsm-2:         [PASS][19] -> [FAIL][20] +6 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-wcl-2:          [PASS][21] -> [FAIL][22] +4 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-nvls-1:         [PASS][23] -> [FAIL][24] +4 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-wcl-1:          [PASS][25] -> [FAIL][26] +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][27] -> [FAIL][28] +6 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
    - bat-bmg-1:          [PASS][29] -> [FAIL][30] +6 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-ptl-1:          [PASS][31] -> [FAIL][32] +4 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
    - bat-lnl-1:          [PASS][33] -> [FAIL][34] +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][35] -> [FAIL][36] +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-ptl-2:          [PASS][37] -> [FAIL][38] +4 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-2:          [PASS][39] -> [FAIL][40] +4 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
    - bat-nvls-2:         [PASS][41] -> [FAIL][42] +4 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_module_load@load:
    - bat-nvls-2:         [PASS][43] -> [DMESG-FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][45] -> [DMESG-FAIL][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][47] -> [DMESG-FAIL][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][49] -> [DMESG-FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][51] -> [DMESG-FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][53] -> [DMESG-FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][55] -> [DMESG-FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][57] -> [DMESG-FAIL][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_module_load@load.html
    - bat-ptl-2:          [PASS][59] -> [DMESG-FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][61] -> [DMESG-FAIL][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][63] -> [DMESG-FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_module_load@load.html
    - bat-nvls-1:         [PASS][65] -> [DMESG-FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][67] -> [DMESG-FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_module_load@load.html

  * igt@xe_query@multigpu-query-pxp-status:
    - bat-bmg-3:          [PASS][69] -> [SKIP][70] +71 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_sysfs_scheduler@job_timeout_ms-min-max:
    - bat-atsm-2:         [PASS][71] -> [SKIP][72] +164 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-wcl-1:          [PASS][73] -> [SKIP][74] +243 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html

  * igt@xe_vm@shared-pte-page:
    - bat-wcl-2:          [PASS][75] -> [SKIP][76] +222 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_vm@shared-pte-page.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_vm@shared-pte-page.html

  
#### Warnings ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-nvls-1:         [DMESG-WARN][77] ([Intel XE#8762] / [Intel XE#9069]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          [SKIP][79] ([Intel XE#5765]) -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-1:          [SKIP][81] ([Intel XE#1466]) -> [SKIP][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][83] ([Intel XE#2233]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-2:          [SKIP][85] ([Intel XE#7245]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          [SKIP][87] ([Intel XE#2233]) -> [SKIP][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-nvls-1:         [SKIP][89] ([Intel XE#8757]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-nvls-2:         [SKIP][91] ([Intel XE#8757]) -> [SKIP][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-ptl-2:          [SKIP][93] ([Intel XE#5765]) -> [SKIP][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-1:          [SKIP][95] ([Intel XE#7245]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-atsm-2:         [SKIP][97] ([i915#6077]) -> [SKIP][98] +30 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][99] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][100] +13 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
    - bat-atsm-2:         [SKIP][101] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) -> [SKIP][102] +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          [SKIP][103] ([Intel XE#5766]) -> [SKIP][104] +13 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-nvls-1:         [SKIP][105] ([Intel XE#8759]) -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@kms_dsc@dsc-basic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@kms_dsc@dsc-basic.html
    - bat-ptl-2:          [SKIP][107] ([Intel XE#5907]) -> [SKIP][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_dsc@dsc-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_dsc@dsc-basic.html
    - bat-bmg-1:          [SKIP][109] ([Intel XE#8265]) -> [SKIP][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         [SKIP][111] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947]) -> [SKIP][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-wcl-1:          [SKIP][113] ([Intel XE#8265]) -> [SKIP][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@kms_dsc@dsc-basic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          [SKIP][115] ([Intel XE#2482]) -> [SKIP][116] +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-wcl-2:          [SKIP][117] ([Intel XE#7240]) -> [SKIP][118] +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-lnl-2:          [SKIP][119] ([Intel XE#2235] / [Intel XE#2482]) -> [SKIP][120] +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-nvls-2:         [SKIP][121] ([Intel XE#8756] / [Intel XE#8783]) -> [SKIP][122] +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - bat-ptl-1:          [SKIP][123] ([Intel XE#5769]) -> [SKIP][124] +3 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_flip@basic-plain-flip.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          [SKIP][125] ([Intel XE#352]) -> [SKIP][126] +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          [SKIP][127] ([Intel XE#5781]) -> [SKIP][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-bmg-2:          [SKIP][129] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         [SKIP][131] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-wcl-2:          [SKIP][133] ([Intel XE#7246]) -> [SKIP][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-nvls-2:         [SKIP][135] ([Intel XE#8761] / [Intel XE#8773]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][137] ([Intel XE#540]) -> [SKIP][138] +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-1:          [SKIP][139] ([Intel XE#1470] / [Intel XE#2853]) -> [SKIP][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-wcl-2:          [SKIP][141] ([Intel XE#7237]) -> [SKIP][142] +13 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         [SKIP][143] ([Intel XE#8755]) -> [SKIP][144] +13 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
    - bat-atsm-2:         [SKIP][145] ([Intel XE#829] / [i915#1836]) -> [SKIP][146] +6 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][147] ([Intel XE#780]) -> [SKIP][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_prop_blob@basic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][149] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][150] +6 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-wcl-2:          [SKIP][151] ([Intel XE#2850]) -> [SKIP][152] +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-1:          [SKIP][153] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][154] +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-nvls-2:         [SKIP][155] ([Intel XE#8758] / [Intel XE#8784]) -> [SKIP][156] +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          [SKIP][157] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][158] +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-lnl-1:          [SKIP][159] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][160] +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-lnl-2:          [SKIP][161] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][162] +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_ccs@block-copy-compressed:
    - bat-adlp-7:         [SKIP][163] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) -> [SKIP][164] +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-adlp-7:         [SKIP][165] ([Intel XE#6360]) -> [SKIP][166] +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html
    - bat-atsm-2:         [SKIP][167] ([Intel XE#8380]) -> [SKIP][168] +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][169] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][170] +9 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_evict@evict-beng-small.html
    - bat-ptl-2:          [SKIP][171] ([Intel XE#5764]) -> [SKIP][172] +11 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_evict@evict-beng-small.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          [SKIP][173] ([Intel XE#5764]) -> [SKIP][174] +11 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
    - bat-lnl-1:          [SKIP][175] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][176] +11 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-2:          [SKIP][177] ([Intel XE#7238]) -> [SKIP][178] +11 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html
    - bat-nvls-1:         [SKIP][179] ([Intel XE#8777]) -> [SKIP][180] +9 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html
    - bat-nvls-2:         [SKIP][181] ([Intel XE#8777]) -> [SKIP][182] +9 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html
    - bat-wcl-1:          [SKIP][183] ([Intel XE#7238]) -> [SKIP][184] +11 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-nvls-1:         [SKIP][185] ([Intel XE#8744]) -> [SKIP][186] +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-lnl-2:          [SKIP][187] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][188] +11 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-nvls-2:         [SKIP][189] ([Intel XE#8744]) -> [SKIP][190] +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-adlp-7:         [SKIP][191] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][192] +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-parallel-basic:
    - bat-lnl-1:          [SKIP][193] ([Intel XE#7482]) -> [SKIP][194] +17 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          [SKIP][195] ([Intel XE#7482]) -> [SKIP][196] +17 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
    - bat-nvls-2:         [SKIP][197] ([Intel XE#8741]) -> [SKIP][198] +17 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-ptl-1:          [SKIP][199] ([Intel XE#7482]) -> [SKIP][200] +17 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-adlp-7:         [SKIP][201] ([Intel XE#7482]) -> [SKIP][202] +17 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - bat-ptl-2:          [SKIP][203] ([Intel XE#7482]) -> [SKIP][204] +17 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          [SKIP][205] ([Intel XE#7482]) -> [SKIP][206] +17 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-nvls-1:         [SKIP][207] ([Intel XE#8741]) -> [SKIP][208] +17 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-wcl-2:          [SKIP][209] ([Intel XE#7482]) -> [SKIP][210] +17 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-atsm-2:         [SKIP][211] ([Intel XE#8381]) -> [SKIP][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         [SKIP][213] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][214] +33 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - bat-atsm-2:         [SKIP][215] ([Intel XE#288]) -> [SKIP][216] +32 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - bat-atsm-2:         [SKIP][217] ([Intel XE#8376]) -> [SKIP][218] +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - bat-adlp-7:         [SKIP][219] ([Intel XE#8376]) -> [SKIP][220] +3 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - bat-bmg-1:          [SKIP][221] ([Intel XE#8364]) -> [SKIP][222] +13 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - bat-ptl-1:          [SKIP][223] ([Intel XE#8364]) -> [SKIP][224] +13 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-lnl-2:          [SKIP][225] ([Intel XE#8364]) -> [SKIP][226] +13 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
    - bat-nvls-2:         [SKIP][227] ([Intel XE#8377]) -> [SKIP][228] +13 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - bat-atsm-2:         [SKIP][229] ([Intel XE#8364]) -> [SKIP][230] +13 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-ptl-2:          [SKIP][231] ([Intel XE#8364]) -> [SKIP][232] +13 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
    - bat-wcl-1:          [SKIP][233] ([Intel XE#8364]) -> [SKIP][234] +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-wcl-2:          [SKIP][235] ([Intel XE#8364]) -> [SKIP][236] +13 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
    - bat-nvls-1:         [SKIP][237] ([Intel XE#8377]) -> [SKIP][238] +13 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_multi_queue@priority:
    - bat-lnl-1:          [SKIP][239] ([Intel XE#8364]) -> [SKIP][240] +13 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_exec_multi_queue@priority.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_exec_multi_queue@priority.html
    - bat-bmg-2:          [SKIP][241] ([Intel XE#8364]) -> [SKIP][242] +13 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
    - bat-adlp-7:         [SKIP][243] ([Intel XE#8364] / [Intel XE#8377]) -> [SKIP][244] +13 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_multi_queue@priority.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_multi_queue@priority.html

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-adlp-7:         [SKIP][245] ([Intel XE#4915]) -> [SKIP][246] +11 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@twice-free:
    - bat-atsm-2:         [SKIP][247] ([Intel XE#8379]) -> [SKIP][248] +11 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-1:         [SKIP][249] ([Intel XE#8746]) -> [SKIP][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_huc_copy@huc_copy.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_huc_copy@huc_copy.html
    - bat-nvls-2:         [SKIP][251] ([Intel XE#8746]) -> [SKIP][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_huc_copy@huc_copy.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][253] ([Intel XE#255]) -> [SKIP][254]
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          [SKIP][255] ([Intel XE#5775]) -> [FAIL][256] +2 other tests fail
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          [SKIP][257] ([Intel XE#2229]) -> [FAIL][258] +2 other tests fail
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
    - bat-adlp-7:         [SKIP][259] ([Intel XE#2229] / [Intel XE#455]) -> [FAIL][260] +2 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][261] ([Intel XE#2229]) -> [FAIL][262] +2 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
    - bat-nvls-1:         [SKIP][263] ([Intel XE#8792]) -> [FAIL][264]
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo.html
    - bat-nvls-2:         [SKIP][265] ([Intel XE#8792]) -> [FAIL][266]
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_bo.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-wcl-2:          [SKIP][267] ([Intel XE#7239]) -> [FAIL][268] +2 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-nvls-1:         [SKIP][269] ([Intel XE#8791] / [Intel XE#8792]) -> [FAIL][270]
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-ptl-2:          [SKIP][271] ([Intel XE#5775]) -> [FAIL][272] +2 other tests fail
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-nvls-2:         [SKIP][273] ([Intel XE#8791] / [Intel XE#8792]) -> [FAIL][274]
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][275] ([Intel XE#2229]) -> [FAIL][276]
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          [SKIP][277] ([Intel XE#2229]) -> [FAIL][278]
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         [SKIP][279] ([Intel XE#2229]) -> [FAIL][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-wcl-1:          [SKIP][281] ([Intel XE#7239]) -> [FAIL][282] +2 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         [SKIP][283] ([Intel XE#2229] / [Intel XE#5488]) -> [FAIL][284]
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-nvls-1:         [SKIP][285] ([Intel XE#8791]) -> [FAIL][286]
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-nvls-2:         [SKIP][287] ([Intel XE#8791]) -> [FAIL][288]
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-2:          [SKIP][289] ([Intel XE#7243]) -> [SKIP][290]
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_mmap@vram.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_mmap@vram.html
    - bat-nvls-1:         [SKIP][291] ([Intel XE#8747]) -> [SKIP][292]
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_mmap@vram.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_mmap@vram.html
    - bat-nvls-2:         [SKIP][293] ([Intel XE#8747]) -> [SKIP][294]
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_mmap@vram.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_mmap@vram.html
    - bat-ptl-2:          [SKIP][295] ([Intel XE#5776]) -> [SKIP][296]
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_mmap@vram.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_mmap@vram.html
    - bat-wcl-1:          [SKIP][297] ([Intel XE#7243]) -> [SKIP][298]
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_mmap@vram.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_mmap@vram.html
    - bat-ptl-1:          [SKIP][299] ([Intel XE#5776]) -> [SKIP][300]
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_mmap@vram.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-lnl-1:          [SKIP][301] ([Intel XE#1416]) -> [SKIP][302]
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_mmap@vram.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_mmap@vram.html
    - bat-adlp-7:         [SKIP][303] ([Intel XE#1008] / [Intel XE#5591]) -> [SKIP][304]
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_mmap@vram.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-lnl-2:          [SKIP][305] ([Intel XE#1416]) -> [SKIP][306]
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_mmap@vram.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-auto:
    - bat-adlp-7:         [SKIP][307] ([Intel XE#8434]) -> [SKIP][308]
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-auto.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-auto.html
    - bat-atsm-2:         [SKIP][309] ([Intel XE#8434]) -> [SKIP][310]
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-auto.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][311] ([Intel XE#977]) -> [SKIP][312]
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][313] ([Intel XE#977]) -> [SKIP][314]
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][315] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590]) -> [SKIP][316]
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][317] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][318]
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][319] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][320]
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][321] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][322]
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-2:          [SKIP][323] ([Intel XE#7247] / [Intel XE#7590]) -> [SKIP][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][325] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][326]
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-nvls-1:         [SKIP][327] ([Intel XE#8748]) -> [SKIP][328]
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][329] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590]) -> [SKIP][330]
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-nvls-2:         [SKIP][331] ([Intel XE#8748]) -> [SKIP][332]
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          [SKIP][333] ([Intel XE#5777] / [Intel XE#7590]) -> [SKIP][334]
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-1:          [SKIP][335] ([Intel XE#7247] / [Intel XE#7590]) -> [SKIP][336]
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][337] ([Intel XE#5777] / [Intel XE#7590]) -> [SKIP][338]
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][339] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][340]
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][341] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][343] ([Intel XE#7590] / [Intel XE#977]) -> [SKIP][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-nvls-2:         [SKIP][345] ([Intel XE#8743]) -> [SKIP][346]
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xelp.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          [SKIP][347] ([Intel XE#7242] / [Intel XE#7590]) -> [SKIP][348]
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][349] ([Intel XE#7242] / [Intel XE#7590]) -> [SKIP][350]
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][351] ([Intel XE#7590] / [Intel XE#977]) -> [SKIP][352]
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
    - bat-nvls-1:         [SKIP][353] ([Intel XE#8743]) -> [SKIP][354]
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xelp.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          [SKIP][355] ([Intel XE#5771] / [Intel XE#7590]) -> [SKIP][356]
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][357] ([Intel XE#5771] / [Intel XE#7590]) -> [SKIP][358]
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][359] ([Intel XE#5780] / [Intel XE#7590]) -> [SKIP][360]
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          [SKIP][361] ([Intel XE#7590] / [Intel XE#979]) -> [SKIP][362]
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][363] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][364]
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][365] ([Intel XE#979]) -> [SKIP][366]
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][367] ([Intel XE#979]) -> [SKIP][368]
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-2:          [SKIP][369] ([Intel XE#7248] / [Intel XE#7590]) -> [SKIP][370]
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][371] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][372]
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-nvls-1:         [SKIP][373] ([Intel XE#8745]) -> [SKIP][374]
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][375] ([Intel XE#2236] / [Intel XE#7590] / [Intel XE#979]) -> [SKIP][376]
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-nvls-2:         [SKIP][377] ([Intel XE#8745]) -> [SKIP][378]
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          [SKIP][379] ([Intel XE#5780] / [Intel XE#7590]) -> [SKIP][380]
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-1:          [SKIP][381] ([Intel XE#7248] / [Intel XE#7590]) -> [SKIP][382]
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          [SKIP][383] ([Intel XE#3342]) -> [SKIP][384]
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-lnl-1:          [SKIP][385] ([Intel XE#3342]) -> [SKIP][386]
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-165879v9_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][387] -> [SKIP][388] ([Intel XE#8749])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][389] -> [SKIP][390] ([Intel XE#8749])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - bat-nvls-1:         [PASS][391] -> [SKIP][392] ([Intel XE#8742]) +4 other tests skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@fbdev@eof.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@fbdev@eof.html
    - bat-wcl-1:          [PASS][393] -> [SKIP][394] ([Intel XE#7241]) +4 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@fbdev@eof.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@fbdev@eof.html
    - bat-lnl-1:          [PASS][395] -> [SKIP][396] ([Intel XE#2134]) +4 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@fbdev@eof.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@fbdev@eof.html

  * igt@fbdev@nullptr:
    - bat-ptl-2:          [PASS][397] -> [SKIP][398] ([Intel XE#5773]) +4 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@fbdev@nullptr.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@fbdev@nullptr.html

  * igt@fbdev@read:
    - bat-bmg-1:          [PASS][399] -> [SKIP][400] ([Intel XE#2134]) +4 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@fbdev@read.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@fbdev@read.html

  * igt@fbdev@write:
    - bat-adlp-7:         [PASS][401] -> [SKIP][402] ([Intel XE#2134]) +4 other tests skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@fbdev@write.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@fbdev@write.html

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [PASS][403] -> [SKIP][404] ([Intel XE#2235]) +30 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-1:          [PASS][405] -> [SKIP][406] ([Intel XE#2351]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][407] -> [SKIP][408] ([Intel XE#2351]) +3 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-2:          [PASS][409] -> [SKIP][410] ([Intel XE#1406]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][411] -> [SKIP][412] ([Intel XE#6964]) +20 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][413] -> [SKIP][414] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_peer2peer@read.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_peer2peer@read.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][415] ([Intel XE#1466] / [Intel XE#2235]) -> [SKIP][416] ([Intel XE#2235])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-1:          [SKIP][417] ([Intel XE#8265]) -> [SKIP][418] ([Intel XE#2351])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][419] ([Intel XE#8265]) -> [SKIP][420] ([Intel XE#2351])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@kms_dsc@dsc-basic.html
    - bat-lnl-2:          [SKIP][421] ([Intel XE#2235]) -> [SKIP][422] ([Intel XE#2235] / [Intel XE#2351])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_dsc@dsc-basic.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-2:          [SKIP][423] ([Intel XE#2235] / [Intel XE#352]) -> [SKIP][424] ([Intel XE#2235]) +2 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][425] ([Intel XE#2235] / [Intel XE#2548] / [Intel XE#7779]) -> [SKIP][426] ([Intel XE#2235] / [Intel XE#2351])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-2:          [SKIP][427] ([Intel XE#1470] / [Intel XE#2235] / [Intel XE#2853]) -> [SKIP][428] ([Intel XE#2235])
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][429] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][430] ([Intel XE#2351]) +2 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          [SKIP][431] ([Intel XE#1406] / [Intel XE#5778]) -> [SKIP][432] ([Intel XE#1406]) +2 other tests skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7240]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240
  [Intel XE#7241]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7241
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243
  [Intel XE#7245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245
  [Intel XE#7246]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379
  [Intel XE#8380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380
  [Intel XE#8381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381
  [Intel XE#8434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8758]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758
  [Intel XE#8759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759
  [Intel XE#8761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#8773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783
  [Intel XE#8784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_9128 -> IGT_9130
  * Linux: xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b -> xe-pw-165879v9

  IGT_9128: 9128
  IGT_9130: 9130
  xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b: c1341b7b7cec27ca50f287ec497e41a8cc88f22b
  xe-pw-165879v9: 165879v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/index.html

--===============2693475045431746922==
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
<tr><td><b>Series:</b></td><td>Add new debug infrastructure for configfs (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165879/">https://patchwork.freedesktop.org/series/165879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b_BAT -&gt; xe-pw-165879v9_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165879v9_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165879v9_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 13)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165879v9_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> +221 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> +270 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> +240 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">SKIP</a> +232 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +222 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">SKIP</a> +184 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> +252 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a> +241 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> +185 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +6 other tests fail</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +4 other tests fail</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +4 other tests fail</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +6 other tests fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +4 other tests fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +3 other tests fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +4 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_scheduler@job_timeout_ms-min-max:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_sysfs_scheduler@job_timeout_ms-min-max.html">SKIP</a> +164 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> +243 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_vm@shared-pte-page.html">SKIP</a> +222 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +13 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759">Intel XE#8759</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240">Intel XE#7240</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756">Intel XE#8756</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783">Intel XE#8783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246">Intel XE#7246</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761">Intel XE#8761</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773">Intel XE#8773</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +3 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237">Intel XE#7237</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +13 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758">Intel XE#8758</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784">Intel XE#8784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380">Intel XE#8380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> +9 other tests skip</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +11 other tests skip</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +9 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +9 other tests skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +11 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_exec_balancer@no-exec-parallel-basic.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +17 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381">Intel XE#8381</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> +13 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> +13 other tests skip</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-free:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379">Intel XE#8379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_exec_system_allocator@twice-free.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo.html">FAIL</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165879v9_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8749">Intel XE#8749</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-nvls-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-nvls-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8742">Intel XE#8742</a>) +4 other tests skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-wcl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-wcl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7241">Intel XE#7241</a>) +4 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773">Intel XE#5773</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-1/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-1/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-2/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165879v9/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9128 -&gt; IGT_9130</li>
<li>Linux: xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b -&gt; xe-pw-165879v9</li>
</ul>
<p>IGT_9128: 9128<br />
  IGT_9130: 9130<br />
  xe-5889-c1341b7b7cec27ca50f287ec497e41a8cc88f22b: c1341b7b7cec27ca50f287ec497e41a8cc88f22b<br />
  xe-pw-165879v9: 165879v9</p>

</body>
</html>

--===============2693475045431746922==--
