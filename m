Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69261C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 22:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D61710E189;
	Fri, 14 Aug 2026 22:27:39 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C3910E106;
 Fri, 14 Aug 2026 22:27:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8984552146192111442=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/guc=3A_Test_GuC_v70=2E74=2E0_for_BMG=2C_LNL=2C_PTL=2C_?=
 =?utf-8?q?NVL-S/U/H?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Aug 2026 22:27:38 -0000
Message-ID: <178674645884.54513.12332463233303233302@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260814210758.2779837-3-julia.filipchuk@intel.com>
In-Reply-To: <20260814210758.2779837-3-julia.filipchuk@intel.com>
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

--===============8984552146192111442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Test GuC v70.74.0 for BMG, LNL, PTL, NVL-S/U/H
URL   : https://patchwork.freedesktop.org/series/172255/
State : failure

== Summary ==

CI Bug Log - changes from xe-5601-563148cb56c59bbf082d44150298185ab0d5002e_BAT -> xe-pw-172255v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172255v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172255v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172255v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-4-tiled:
    - bat-nvls-2:         [PASS][1] -> [SKIP][2] +219 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-ptl-1:          [PASS][3] -> [SKIP][4] +220 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [PASS][5] -> [SKIP][6] +182 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][7] -> [SKIP][8] +251 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-wcl-2:          [PASS][9] -> [FAIL][10] +4 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][11] -> [FAIL][12] +6 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-ptl-1:          [PASS][13] -> [FAIL][14] +4 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-2:          [PASS][15] -> [FAIL][16] +4 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
    - bat-nvls-2:         [PASS][17] -> [FAIL][18] +4 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_module_load@load:
    - bat-nvls-2:         [PASS][19] -> [DMESG-FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][23] -> [DMESG-FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][25] -> [DMESG-FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][27] -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-1/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][29] -> [DMESG-FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-ptl-2:          [PASS][31] -> [ABORT][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-2/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][33] -> [DMESG-FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][35] -> [ABORT][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-1/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][37] -> [DMESG-FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_module_load@load.html

  * igt@xe_query@multigpu-query-pxp-status:
    - bat-bmg-3:          [PASS][39] -> [SKIP][40] +71 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_vm@shared-pte-page:
    - bat-wcl-2:          [PASS][41] -> [SKIP][42] +220 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_vm@shared-pte-page.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_vm@shared-pte-page.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          [SKIP][43] ([Intel XE#5765]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][45] ([Intel XE#2233]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-2:          [SKIP][47] ([Intel XE#7245]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-nvls-2:         [SKIP][49] ([Intel XE#8757]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][51] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][52] +13 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          [SKIP][53] ([Intel XE#5766]) -> [SKIP][54] +13 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-bmg-2:          [SKIP][55] ([Intel XE#2482]) -> [SKIP][56] +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-wcl-2:          [SKIP][57] ([Intel XE#7240]) -> [SKIP][58] +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-lnl-2:          [SKIP][59] ([Intel XE#2235] / [Intel XE#2482]) -> [SKIP][60] +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-nvls-2:         [SKIP][61] ([Intel XE#8756] / [Intel XE#8783]) -> [SKIP][62] +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-plain-flip:
    - bat-ptl-1:          [SKIP][63] ([Intel XE#5769]) -> [SKIP][64] +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_flip@basic-plain-flip.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_flip@basic-plain-flip.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          [SKIP][65] ([Intel XE#5781]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-bmg-2:          [SKIP][67] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-wcl-2:          [SKIP][69] ([Intel XE#7246]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-nvls-2:         [SKIP][71] ([Intel XE#8761] / [Intel XE#8773]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-wcl-2:          [SKIP][73] ([Intel XE#7237]) -> [SKIP][74] +13 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         [SKIP][75] ([Intel XE#8755]) -> [SKIP][76] +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-wcl-2:          [SKIP][77] ([Intel XE#2850]) -> [SKIP][78] +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-nvls-2:         [SKIP][79] ([Intel XE#8758] / [Intel XE#8784]) -> [SKIP][80] +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          [SKIP][81] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][82] +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-lnl-2:          [SKIP][83] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][84] +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          [SKIP][85] ([Intel XE#5764]) -> [SKIP][86] +11 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-2:          [SKIP][87] ([Intel XE#7238]) -> [SKIP][88] +11 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html
    - bat-nvls-2:         [SKIP][89] ([Intel XE#8777]) -> [SKIP][90] +9 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-lnl-2:          [SKIP][91] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][92] +11 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-nvls-2:         [SKIP][93] ([Intel XE#8744]) -> [SKIP][94] +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          [SKIP][95] ([Intel XE#7482]) -> [SKIP][96] +17 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
    - bat-nvls-2:         [SKIP][97] ([Intel XE#8741]) -> [SKIP][98] +17 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_balancer@twice-cm-virtual-rebind:
    - bat-ptl-1:          [SKIP][99] ([Intel XE#7482]) -> [SKIP][100] +17 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - bat-wcl-2:          [SKIP][101] ([Intel XE#7482]) -> [SKIP][102] +17 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - bat-ptl-1:          [SKIP][103] ([Intel XE#8364]) -> [SKIP][104] +13 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - bat-lnl-2:          [SKIP][105] ([Intel XE#8364]) -> [SKIP][106] +13 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
    - bat-nvls-2:         [SKIP][107] ([Intel XE#8377]) -> [SKIP][108] +13 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-wcl-2:          [SKIP][109] ([Intel XE#8364]) -> [SKIP][110] +13 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_multi_queue@priority:
    - bat-bmg-2:          [SKIP][111] ([Intel XE#8364]) -> [SKIP][112] +13 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-2:         [SKIP][113] ([Intel XE#8746]) -> [SKIP][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_huc_copy@huc_copy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          [SKIP][115] ([Intel XE#5775]) -> [FAIL][116] +2 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-2:          [SKIP][117] ([Intel XE#2229]) -> [FAIL][118] +2 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
    - bat-nvls-2:         [SKIP][119] ([Intel XE#8792]) -> [FAIL][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_bo.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-wcl-2:          [SKIP][121] ([Intel XE#7239]) -> [FAIL][122] +2 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-nvls-2:         [SKIP][123] ([Intel XE#8791] / [Intel XE#8792]) -> [FAIL][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][125] ([Intel XE#2229]) -> [FAIL][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-nvls-2:         [SKIP][127] ([Intel XE#8791]) -> [FAIL][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-wcl-2:          [SKIP][129] ([Intel XE#7243]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_mmap@vram.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_mmap@vram.html
    - bat-nvls-2:         [SKIP][131] ([Intel XE#8747]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_mmap@vram.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_mmap@vram.html
    - bat-ptl-1:          [SKIP][133] ([Intel XE#5776]) -> [SKIP][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_mmap@vram.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-lnl-2:          [SKIP][135] ([Intel XE#1416]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_mmap@vram.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          [SKIP][137] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-2:          [SKIP][139] ([Intel XE#7247] / [Intel XE#7590]) -> [SKIP][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][141] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590]) -> [SKIP][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-nvls-2:         [SKIP][143] ([Intel XE#8748]) -> [SKIP][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][145] ([Intel XE#5777] / [Intel XE#7590]) -> [SKIP][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][147] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][149] ([Intel XE#7590] / [Intel XE#977]) -> [SKIP][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-nvls-2:         [SKIP][151] ([Intel XE#8743]) -> [SKIP][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xelp.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][153] ([Intel XE#7242] / [Intel XE#7590]) -> [SKIP][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][155] ([Intel XE#5771] / [Intel XE#7590]) -> [SKIP][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][157] ([Intel XE#5780] / [Intel XE#7590]) -> [SKIP][158]
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][159] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-2:          [SKIP][161] ([Intel XE#7248] / [Intel XE#7590]) -> [SKIP][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][163] ([Intel XE#2236] / [Intel XE#7590] / [Intel XE#979]) -> [SKIP][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-nvls-2:         [SKIP][165] ([Intel XE#8745]) -> [SKIP][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          [SKIP][167] ([Intel XE#3342]) -> [SKIP][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-172255v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [PASS][169] -> [SKIP][170] ([Intel XE#2235]) +30 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_multigpu_svm@mgpu-latency-prefetch:
    - bat-bmg-3:          [PASS][171] -> [SKIP][172] ([Intel XE#6964]) +20 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][173] -> [SKIP][174] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_peer2peer@read.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_peer2peer@read.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][175] ([Intel XE#1466] / [Intel XE#2235]) -> [SKIP][176] ([Intel XE#2235])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          [SKIP][177] ([Intel XE#2235]) -> [SKIP][178] ([Intel XE#2235] / [Intel XE#2351])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_dsc@dsc-basic.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-2:          [SKIP][179] ([Intel XE#2235] / [Intel XE#352]) -> [SKIP][180] ([Intel XE#2235]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][181] ([Intel XE#2235] / [Intel XE#2548] / [Intel XE#7779]) -> [SKIP][182] ([Intel XE#2235] / [Intel XE#2351])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-2:          [SKIP][183] ([Intel XE#1470] / [Intel XE#2235] / [Intel XE#2853]) -> [SKIP][184] ([Intel XE#2235])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][185] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][186] ([Intel XE#2351]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          [SKIP][187] ([Intel XE#1406] / [Intel XE#5778]) -> [SKIP][188] ([Intel XE#1406]) +2 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
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
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7237]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238
  [Intel XE#7239]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239
  [Intel XE#7240]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240
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
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8755]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755
  [Intel XE#8756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8758]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758
  [Intel XE#8761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761
  [Intel XE#8773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773
  [Intel XE#8777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777
  [Intel XE#8783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783
  [Intel XE#8784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784
  [Intel XE#8791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791
  [Intel XE#8792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-5601-563148cb56c59bbf082d44150298185ab0d5002e -> xe-pw-172255v1

  IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5601-563148cb56c59bbf082d44150298185ab0d5002e: 563148cb56c59bbf082d44150298185ab0d5002e
  xe-pw-172255v1: 172255v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/index.html

--===============8984552146192111442==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Test GuC v70.74.0 for BMG, LNL, PTL, NVL-S/U/H</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172255/">https://patchwork.freedesktop.org/series/172255/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5601-563148cb56c59bbf082d44150298185ab0d5002e_BAT -&gt; xe-pw-172255v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172255v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172255v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172255v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-4-tiled:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-4-tiled.html">SKIP</a> +219 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">SKIP</a> +182 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> +251 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +4 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_vm@shared-pte-page.html">SKIP</a> +220 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240">Intel XE#7240</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8756">Intel XE#8756</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8783">Intel XE#8783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_flip@basic-plain-flip.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246">Intel XE#7246</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8761">Intel XE#8761</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8773">Intel XE#8773</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237">Intel XE#7237</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8755">Intel XE#8755</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8758">Intel XE#8758</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8784">Intel XE#8784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +11 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8777">Intel XE#8777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +11 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +17 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-rebind:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_exec_balancer@twice-cm-virtual-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> +13 other tests skip</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_bo.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8792">Intel XE#8792</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8791">Intel XE#8791</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-nvls-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172255v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-prefetch:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-latency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5601-563148cb56c59bbf082d44150298185ab0d5002e/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5601-563148cb56c59bbf082d44150298185ab0d5002e -&gt; xe-pw-172255v1</li>
</ul>
<p>IGT_9057: 8f7d5198bdb1c5af7c97b967a0bcbe77b653e8a0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5601-563148cb56c59bbf082d44150298185ab0d5002e: 563148cb56c59bbf082d44150298185ab0d5002e<br />
  xe-pw-172255v1: 172255v1</p>

</body>
</html>

--===============8984552146192111442==--
