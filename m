Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D1CF2561
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 00:43:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61D110E212;
	Wed, 19 Nov 2025 00:43:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0C910E212;
 Wed, 19 Nov 2025 00:43:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3688898464322690164=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E54=2E0_for_BMG=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 00:43:51 -0000
Message-ID: <176351303194.6923.6463879520464612410@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118235218.1788466-2-julia.filipchuk@intel.com>
In-Reply-To: <20251118235218.1788466-2-julia.filipchuk@intel.com>
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

--===============3688898464322690164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.54.0 for BMG, PTL
URL   : https://patchwork.freedesktop.org/series/157751/
State : failure

== Summary ==

CI Bug Log - changes from xe-4124-b603326a067916accf680fd623f4fc3c22bba487_BAT -> xe-pw-157751v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157751v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157751v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157751v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][1] -> [SKIP][2] +212 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-ptl-1:          [PASS][3] -> [FAIL][4] +4 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][7] -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][11] -> [DMESG-FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-1/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - bat-bmg-3:          [PASS][15] -> [SKIP][16] +71 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@query-invalid-size:
    - bat-ptl-1:          [PASS][17] -> [SKIP][18] +212 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_query@query-invalid-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_query@query-invalid-size.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          [SKIP][19] ([Intel XE#5765]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][21] ([Intel XE#2233]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][23] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][24] +11 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          [SKIP][25] ([Intel XE#5766]) -> [SKIP][26] +13 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-1:          [SKIP][27] ([Intel XE#5769]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html
    - bat-bmg-2:          [SKIP][29] ([Intel XE#2482]) -> [SKIP][30] +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          [SKIP][31] ([Intel XE#5781]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          [SKIP][33] ([Intel XE#4837]) -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          [SKIP][35] ([Intel XE#5764]) -> [SKIP][36] +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          [SKIP][37] ([Intel XE#5775]) -> [FAIL][38] +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          [SKIP][39] ([Intel XE#5776]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_mmap@vram.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-1:          [SKIP][41] ([Intel XE#5777]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][43] ([Intel XE#2245]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][45] ([Intel XE#5771]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][47] ([Intel XE#5780]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][49] ([Intel XE#2236]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in xe-pw-157751v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - bat-bmg-3:          [PASS][51] -> [SKIP][52] ([Intel XE#6557]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][53] -> [FAIL][54] ([Intel XE#3099]) +6 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_spin_batch@spin-basic:
    - bat-bmg-2:          [PASS][55] -> [SKIP][56] ([Intel XE#6557]) +12 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_spin_batch@spin-basic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_spin_batch@spin-basic.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][57] ([Intel XE#4543]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][59] ([Intel XE#6520]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-2:          [SKIP][61] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][62] ([Intel XE#2231])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_dsc@dsc-basic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          [SKIP][63] ([Intel XE#2434] / [Intel XE#2548]) -> [SKIP][64] ([Intel XE#2231])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@read-crc:
    - bat-bmg-2:          [SKIP][65] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][66] ([Intel XE#6557])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_pipe_crc_basic@read-crc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_pipe_crc_basic@read-crc.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          [SKIP][67] ([Intel XE#1406] / [Intel XE#5778]) -> [SKIP][68] ([Intel XE#1406]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          [SKIP][69] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][70] ([Intel XE#1406] / [Intel XE#2231]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][71] ([Intel XE#2229]) -> [FAIL][72] ([Intel XE#3099])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-bmg-2:          [SKIP][73] ([Intel XE#1420]) -> [SKIP][74] ([Intel XE#6557])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
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
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557


Build changes
-------------

  * IGT: IGT_8631 -> IGT_8632
  * Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -> xe-pw-157751v1

  IGT_8631: 8631
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487
  xe-pw-157751v1: 157751v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/index.html

--===============3688898464322690164==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.54.0 for BMG, PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157751/">https://patchwork.freedesktop.org/series/157751/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4124-b603326a067916accf680fd623f4fc3c22bba487_BAT -&gt; xe-pw-157751v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157751v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-157751v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-157751v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> +212 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_query@query-invalid-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_query@query-invalid-size.html">SKIP</a> +212 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157751v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_spin_batch@spin-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_spin_batch@spin-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) +12 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_pipe_crc_basic@read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4124-b603326a067916accf680fd623f4fc3c22bba487/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8631 -&gt; IGT_8632</li>
<li>Linux: xe-4124-b603326a067916accf680fd623f4fc3c22bba487 -&gt; xe-pw-157751v1</li>
</ul>
<p>IGT_8631: 8631<br />
  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4124-b603326a067916accf680fd623f4fc3c22bba487: b603326a067916accf680fd623f4fc3c22bba487<br />
  xe-pw-157751v1: 157751v1</p>

</body>
</html>

--===============3688898464322690164==--
