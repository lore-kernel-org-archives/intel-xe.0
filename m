Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFF3C44508
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 17:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B099410E656;
	Tue, 14 Jul 2026 17:36:09 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EAF10E08C;
 Tue, 14 Jul 2026 17:36:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6653426900300065591=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_More_BIOS_FB_take?=
 =?utf-8?q?over_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 17:36:09 -0000
Message-ID: <178405056912.189125.15854503069705760227@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260714162824.2063637-1-dev@lankhorst.se>
In-Reply-To: <20260714162824.2063637-1-dev@lankhorst.se>
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

--===============6653426900300065591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: More BIOS FB takeover fixes
URL   : https://patchwork.freedesktop.org/series/170430/
State : failure

== Summary ==

CI Bug Log - changes from xe-5399-45c0f0c41055eb52626f68070e895739d22531a6_BAT -> xe-pw-170430v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-170430v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-170430v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 11)
------------------------------

  Missing    (2): bat-bmg-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-170430v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-ptl-2:          [PASS][1] -> [SKIP][2] +238 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@bo-too-small:
    - bat-wcl-2:          [PASS][3] -> [SKIP][4] +220 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_addfb_basic@bo-too-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-ptl-1:          [PASS][5] -> [SKIP][6] +220 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html

  * igt@xe_exec_basic@twice-bindexecqueue-userptr:
    - bat-bmg-2:          [PASS][7] -> [SKIP][8] +250 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][9] -> [SKIP][10] +162 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][11] -> [SKIP][12] +183 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-wcl-1:          [PASS][13] -> [FAIL][14] +4 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-wcl-2:          [PASS][15] -> [FAIL][16] +4 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] +6 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
    - bat-ptl-1:          [PASS][19] -> [FAIL][20] +4 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][21] -> [FAIL][22] +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-ptl-2:          [PASS][23] -> [FAIL][24] +4 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][25] -> [DMESG-FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][27] -> [DMESG-FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][29] -> [DMESG-FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][31] -> [DMESG-FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][33] -> [DMESG-FAIL][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][35] -> [DMESG-FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][37] -> [DMESG-FAIL][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][39] -> [DMESG-FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][41] -> [DMESG-FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_module_load@load.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - bat-bmg-3:          [PASS][43] -> [SKIP][44] +71 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          [PASS][45] -> [SKIP][46] +268 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-front:
    - bat-wcl-1:          [PASS][47] -> [SKIP][48] +241 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          [SKIP][49] ([Intel XE#5765]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-2:          [SKIP][51] ([Intel XE#7245]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-2:          [SKIP][53] ([Intel XE#2233]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-bmg-1:          [SKIP][55] ([Intel XE#2233]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-ptl-2:          [SKIP][57] ([Intel XE#5765]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-wcl-1:          [SKIP][59] ([Intel XE#7245]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][61] ([i915#6077]) -> [SKIP][62] +30 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][63] ([Intel XE#1024] / [Intel XE#782] / [Intel XE#947]) -> [SKIP][64] +5 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
    - bat-bmg-2:          [SKIP][65] ([Intel XE#2489] / [Intel XE#3419]) -> [SKIP][66] +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          [SKIP][67] ([Intel XE#5766]) -> [SKIP][68] +13 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          [SKIP][69] ([Intel XE#8265]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_dsc@dsc-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-ptl-2:          [SKIP][71] ([Intel XE#5907]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_dsc@dsc-basic.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         [SKIP][73] ([Intel XE#1024] / [Intel XE#784] / [Intel XE#947]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-wcl-1:          [SKIP][75] ([Intel XE#8265]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@kms_dsc@dsc-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-1:          [SKIP][77] ([Intel XE#5769]) -> [SKIP][78] +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html
    - bat-wcl-2:          [SKIP][79] ([Intel XE#7240]) -> [SKIP][80] +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_flip@basic-flip-vs-modeset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_flip@basic-flip-vs-modeset.html
    - bat-bmg-2:          [SKIP][81] ([Intel XE#2482]) -> [SKIP][82] +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          [SKIP][83] ([Intel XE#5781]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
    - bat-wcl-2:          [SKIP][85] ([Intel XE#7246]) -> [SKIP][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-bmg-2:          [SKIP][87] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         [SKIP][89] ([Intel XE#1024] / [Intel XE#783] / [Intel XE#947]) -> [SKIP][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-atsm-2:         [SKIP][91] ([Intel XE#540]) -> [SKIP][92] +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-wcl-2:          [SKIP][93] ([Intel XE#7237]) -> [SKIP][94] +13 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][95] ([Intel XE#829] / [i915#1836]) -> [SKIP][96] +6 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][97] ([Intel XE#780]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_prop_blob@basic.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][99] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][100] +6 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-wcl-2:          [SKIP][101] ([Intel XE#2850]) -> [SKIP][102] +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-2:          [SKIP][103] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][104] +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html
    - bat-bmg-1:          [SKIP][105] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][106] +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_ccs@block-copy-compressed:
    - bat-adlp-7:         [SKIP][107] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) -> [SKIP][108] +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute_preempt@compute-preempt:
    - bat-adlp-7:         [SKIP][109] ([Intel XE#6360]) -> [SKIP][110] +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html
    - bat-atsm-2:         [SKIP][111] ([Intel XE#8380]) -> [SKIP][112] +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         [SKIP][113] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) -> [SKIP][114] +9 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_evict@evict-beng-small.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html
    - bat-ptl-2:          [SKIP][115] ([Intel XE#5764]) -> [SKIP][116] +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_evict@evict-beng-small.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          [SKIP][117] ([Intel XE#5764]) -> [SKIP][118] +11 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-wcl-1:          [SKIP][119] ([Intel XE#7238]) -> [SKIP][120] +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict@evict-small-multi-vm:
    - bat-wcl-2:          [SKIP][121] ([Intel XE#7238]) -> [SKIP][122] +11 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         [SKIP][123] ([Intel XE#5563] / [Intel XE#688]) -> [SKIP][124] +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-cm-virtual-userptr:
    - bat-wcl-2:          [SKIP][125] ([Intel XE#7482]) -> [SKIP][126] +17 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html

  * igt@xe_exec_balancer@twice-parallel-userptr:
    - bat-ptl-2:          [SKIP][127] ([Intel XE#7482]) -> [SKIP][128] +17 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - bat-ptl-1:          [SKIP][129] ([Intel XE#7482]) -> [SKIP][130] +17 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_exec_balancer@twice-virtual-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - bat-wcl-1:          [SKIP][131] ([Intel XE#7482]) -> [SKIP][132] +17 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-adlp-7:         [SKIP][133] ([Intel XE#7482]) -> [SKIP][134] +17 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va:
    - bat-atsm-2:         [SKIP][135] ([Intel XE#8381]) -> [SKIP][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][137] ([Intel XE#288]) -> [SKIP][138] +32 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][139] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][140] +33 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - bat-adlp-7:         [SKIP][141] ([Intel XE#8376]) -> [SKIP][142] +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - bat-atsm-2:         [SKIP][143] ([Intel XE#8376]) -> [SKIP][144] +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_multi_queue@exec-sanity:
    - bat-bmg-1:          [SKIP][145] ([Intel XE#8364]) -> [SKIP][146] +13 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html

  * igt@xe_exec_multi_queue@many-queues-basic:
    - bat-ptl-1:          [SKIP][147] ([Intel XE#8364]) -> [SKIP][148] +13 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:
    - bat-atsm-2:         [SKIP][149] ([Intel XE#8364]) -> [SKIP][150] +13 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html

  * igt@xe_exec_multi_queue@many-queues-priority:
    - bat-ptl-2:          [SKIP][151] ([Intel XE#8364]) -> [SKIP][152] +13 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html
    - bat-wcl-1:          [SKIP][153] ([Intel XE#8364]) -> [SKIP][154] +13 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html

  * igt@xe_exec_multi_queue@priority:
    - bat-wcl-2:          [SKIP][155] ([Intel XE#8364]) -> [SKIP][156] +13 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_exec_multi_queue@priority.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_exec_multi_queue@priority.html
    - bat-bmg-2:          [SKIP][157] ([Intel XE#8364]) -> [SKIP][158] +13 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html
    - bat-adlp-7:         [SKIP][159] ([Intel XE#8364] / [Intel XE#8377]) -> [SKIP][160] +13 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_multi_queue@priority.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_multi_queue@priority.html

  * igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:
    - bat-adlp-7:         [SKIP][161] ([Intel XE#4915]) -> [SKIP][162] +11 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html

  * igt@xe_exec_system_allocator@partial-munmap-cpu-fault:
    - bat-atsm-2:         [SKIP][163] ([Intel XE#8379]) -> [SKIP][164] +11 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         [SKIP][165] ([Intel XE#255]) -> [SKIP][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          [SKIP][167] ([Intel XE#5775]) -> [FAIL][168] +2 other tests fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-wcl-2:          [SKIP][169] ([Intel XE#7239]) -> [FAIL][170] +2 other tests fail
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-adlp-7:         [SKIP][171] ([Intel XE#2229] / [Intel XE#455]) -> [FAIL][172] +2 other tests fail
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-ptl-2:          [SKIP][173] ([Intel XE#5775]) -> [FAIL][174] +2 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         [SKIP][175] ([Intel XE#2229]) -> [FAIL][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-wcl-1:          [SKIP][177] ([Intel XE#7239]) -> [FAIL][178] +2 other tests fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         [SKIP][179] ([Intel XE#2229] / [Intel XE#5488]) -> [FAIL][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          [SKIP][181] ([Intel XE#5776]) -> [SKIP][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_mmap@vram.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-wcl-2:          [SKIP][183] ([Intel XE#7243]) -> [SKIP][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_mmap@vram.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_mmap@vram.html
    - bat-adlp-7:         [SKIP][185] ([Intel XE#1008] / [Intel XE#5591]) -> [SKIP][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_mmap@vram.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-ptl-2:          [SKIP][187] ([Intel XE#5776]) -> [SKIP][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_mmap@vram.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_mmap@vram.html
    - bat-wcl-1:          [SKIP][189] ([Intel XE#7243]) -> [SKIP][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_mmap@vram.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-auto:
    - bat-adlp-7:         [SKIP][191] ([Intel XE#8434]) -> [SKIP][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-auto.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-auto.html
    - bat-atsm-2:         [SKIP][193] ([Intel XE#8434]) -> [SKIP][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-auto.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-auto.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][195] ([Intel XE#977]) -> [SKIP][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][197] ([Intel XE#977]) -> [SKIP][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-wcl-2:          [SKIP][199] ([Intel XE#7247] / [Intel XE#7590]) -> [SKIP][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][201] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][203] ([Intel XE#1420] / [Intel XE#7590]) -> [SKIP][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][205] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          [SKIP][207] ([Intel XE#5777] / [Intel XE#7590]) -> [SKIP][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-1:          [SKIP][209] ([Intel XE#7247] / [Intel XE#7590]) -> [SKIP][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][211] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][213] ([Intel XE#5777] / [Intel XE#7590]) -> [SKIP][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][215] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][217] ([Intel XE#2245] / [Intel XE#7590]) -> [SKIP][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          [SKIP][219] ([Intel XE#5771] / [Intel XE#7590]) -> [SKIP][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          [SKIP][221] ([Intel XE#7242] / [Intel XE#7590]) -> [SKIP][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][223] ([Intel XE#5771] / [Intel XE#7590]) -> [SKIP][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][225] ([Intel XE#7242] / [Intel XE#7590]) -> [SKIP][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][227] ([Intel XE#5780] / [Intel XE#7590]) -> [SKIP][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-2:          [SKIP][229] ([Intel XE#7248] / [Intel XE#7590]) -> [SKIP][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][231] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][233] ([Intel XE#2236] / [Intel XE#7590]) -> [SKIP][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][235] ([Intel XE#979]) -> [SKIP][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          [SKIP][237] ([Intel XE#5780] / [Intel XE#7590]) -> [SKIP][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-1:          [SKIP][239] ([Intel XE#7248] / [Intel XE#7590]) -> [SKIP][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][241] ([Intel XE#979]) -> [SKIP][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in xe-pw-170430v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][243] -> [SKIP][244] ([Intel XE#8517])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][245] -> [SKIP][246] ([Intel XE#8517])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@info:
    - bat-wcl-1:          [PASS][247] -> [SKIP][248] ([Intel XE#7241]) +4 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@fbdev@info.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - bat-ptl-2:          [PASS][249] -> [SKIP][250] ([Intel XE#5773]) +4 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@fbdev@nullptr.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@fbdev@nullptr.html

  * igt@fbdev@write:
    - bat-bmg-1:          [PASS][251] -> [SKIP][252] ([Intel XE#2134]) +4 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@fbdev@write.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@fbdev@write.html
    - bat-adlp-7:         [PASS][253] -> [SKIP][254] ([Intel XE#2134]) +4 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@fbdev@write.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@fbdev@write.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][255] -> [SKIP][256] ([Intel XE#2351]) +3 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
    - bat-ptl-2:          [PASS][257] -> [SKIP][258] ([Intel XE#1406]) +2 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-2:          [PASS][259] -> [FAIL][260] ([Intel XE#8464]) +6 other tests fail
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][261] -> [FAIL][262] ([Intel XE#8464]) +6 other tests fail
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_multigpu_svm@mgpu-pagefault-conflict:
    - bat-bmg-3:          [PASS][263] -> [SKIP][264] ([Intel XE#6964]) +20 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          [PASS][265] -> [SKIP][266] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_peer2peer@read.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_peer2peer@read.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][267] ([Intel XE#8265]) -> [SKIP][268] ([Intel XE#2351])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          [SKIP][269] ([Intel XE#1406] / [Intel XE#5778]) -> [SKIP][270] ([Intel XE#1406]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          [SKIP][271] ([Intel XE#2229]) -> [FAIL][272] ([Intel XE#8464])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          [SKIP][273] ([Intel XE#2229]) -> [FAIL][274] ([Intel XE#8464])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419
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
  [Intel XE#8464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464
  [Intel XE#8517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-5399-45c0f0c41055eb52626f68070e895739d22531a6 -> xe-pw-170430v1

  IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5399-45c0f0c41055eb52626f68070e895739d22531a6: 45c0f0c41055eb52626f68070e895739d22531a6
  xe-pw-170430v1: 170430v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/index.html

--===============6653426900300065591==
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
<tr><td><b>Series:</b></td><td>drm/xe: More BIOS FB takeover fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170430/">https://patchwork.freedesktop.org/series/170430/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5399-45c0f0c41055eb52626f68070e895739d22531a6_BAT -&gt; xe-pw-170430v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-170430v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-170430v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 11)</h2>
<p>Missing    (2): bat-bmg-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-170430v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> +238 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_addfb_basic@bo-too-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_addfb_basic@bo-too-small.html">SKIP</a> +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_exec_basic@twice-bindexecqueue-userptr.html">SKIP</a> +250 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">SKIP</a> +162 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> +183 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +6 other tests fail</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +3 other tests fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> +268 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-front:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_vm@munmap-style-unbind-front.html">SKIP</a> +241 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7245">Intel XE#7245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489">Intel XE#2489</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3419">Intel XE#3419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7240">Intel XE#7240</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7246">Intel XE#7246</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7237">Intel XE#7237</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_pipe_crc_basic@hang-read-crc.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_ccs@block-copy-compressed.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360">Intel XE#6360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> +1 other test skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8380">Intel XE#8380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> +9 other tests skip</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-virtual-userptr:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_exec_balancer@twice-cm-virtual-userptr.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-userptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_exec_balancer@twice-parallel-userptr.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_exec_balancer@twice-virtual-basic.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_exec_balancer@twice-virtual-rebind.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8381">Intel XE#8381</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> +3 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8376">Intel XE#8376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@exec-sanity:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_exec_multi_queue@exec-sanity.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_exec_multi_queue@many-queues-basic.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-userptr.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-priority:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_exec_multi_queue@many-queues-priority.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@priority:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_multi_queue@priority.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@eu-fault-2m-range-device-host:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_exec_system_allocator@eu-fault-2m-range-device-host.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@partial-munmap-cpu-fault:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8379">Intel XE#8379</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_exec_system_allocator@partial-munmap-cpu-fault.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7239">Intel XE#7239</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> +2 other tests fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7243">Intel XE#7243</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-auto:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8434">Intel XE#8434</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-auto.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170430v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517">Intel XE#8517</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517">Intel XE#8517</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-wcl-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-wcl-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7241">Intel XE#7241</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773">Intel XE#5773</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@fbdev@write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-conflict:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_multigpu_svm@mgpu-pagefault-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-3/igt@xe_peer2peer@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5399-45c0f0c41055eb52626f68070e895739d22531a6/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170430v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464">Intel XE#8464</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5399-45c0f0c41055eb52626f68070e895739d22531a6 -&gt; xe-pw-170430v1</li>
</ul>
<p>IGT_9006: 6380a8af26359dd222e22679442272ded836c463 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5399-45c0f0c41055eb52626f68070e895739d22531a6: 45c0f0c41055eb52626f68070e895739d22531a6<br />
  xe-pw-170430v1: 170430v1</p>

</body>
</html>

--===============6653426900300065591==--
