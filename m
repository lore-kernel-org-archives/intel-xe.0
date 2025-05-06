Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37384C3ABAC
	for <intel-xe@archiver.kernel.org>; Tue,  6 May 2025 07:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7BE10E14A;
	Tue,  6 May 2025 07:51:05 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98110E14A;
 Tue,  6 May 2025 07:51:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5536653658304797405=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Introducing_firmware_late_b?=
 =?utf-8?q?inding?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 May 2025 07:51:04 -0000
Message-ID: <174651786415.50100.12041416847948382095@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250429073804.972137-1-badal.nilawar@intel.com>
In-Reply-To: <20250429073804.972137-1-badal.nilawar@intel.com>
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

--===============5536653658304797405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introducing firmware late binding
URL   : https://patchwork.freedesktop.org/series/148394/
State : failure

== Summary ==

CI Bug Log - changes from xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345_BAT -> xe-pw-148394v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148394v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148394v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148394v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          NOTRUN -> [SKIP][5] +193 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][6] -> [SKIP][7] +154 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][8] -> [SKIP][9] +218 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][10] -> [SKIP][11] +157 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-atsm-2:         [PASS][12] -> [FAIL][13] +7 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          NOTRUN -> [FAIL][14] +7 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-1:          [PASS][15] -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_module_load@load:
    - bat-adlp-vf:        [PASS][17] -> [DMESG-FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-vf/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-vf/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][23] -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][25] -> [DMESG-FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-1:          [SKIP][27] ([Intel XE#1466]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][29] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          [SKIP][31] ([Intel XE#352]) -> [SKIP][32] +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][33] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          [SKIP][35] ([Intel XE#1470] / [Intel XE#2853]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][37] ([Intel XE#1024]) -> [SKIP][38] +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][39] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][40] +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][42] +9 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_evict@evict-small-cm.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-lnl-1:          [SKIP][43] ([Intel XE#688]) -> [SKIP][44] +11 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         [SKIP][45] ([Intel XE#688]) -> [SKIP][46] +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-7:         [SKIP][47] ([Intel XE#288]) -> [SKIP][48] +27 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][49] ([Intel XE#288]) -> [SKIP][50] +32 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         [SKIP][51] ([Intel XE#255]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-atsm-2:         [SKIP][53] ([Intel XE#2229]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-lnl-1:          [SKIP][55] ([Intel XE#2229]) -> [FAIL][56] +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][57] ([Intel XE#1416]) -> [SKIP][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_mmap@vram.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_mmap@vram.html
    - bat-adlp-7:         [SKIP][59] ([Intel XE#1008]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_mmap@vram.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][61] ([Intel XE#977]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][63] ([Intel XE#977]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][65] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][67] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][69] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][71] ([Intel XE#977]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][73] ([Intel XE#979]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         [SKIP][75] ([Intel XE#979]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         [SKIP][77] ([Intel XE#979]) -> [SKIP][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-1:          [SKIP][79] ([Intel XE#3342]) -> [SKIP][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-148394v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-dg2-oem2:       [PASS][81] -> [SKIP][82] ([Intel XE#2134]) +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@fbdev@eof.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-lnl-1:          [PASS][83] -> [SKIP][84] ([Intel XE#2134]) +4 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@fbdev@info.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-adlp-7:         [PASS][85] -> [SKIP][86] ([Intel XE#2134]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@fbdev@read.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@fbdev@read.html

  * igt@intel_sysfs_debugfs@xe-base:
    - bat-lnl-2:          [PASS][87] -> [SKIP][88] ([Intel XE#4618])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-adlp-7:         [PASS][89] -> [SKIP][90] ([Intel XE#4618]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          NOTRUN -> [SKIP][91] ([Intel XE#4618]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-lnl-1:          [PASS][92] -> [SKIP][93] ([Intel XE#4618]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-dg2-oem2:       [PASS][94] -> [SKIP][95] ([Intel XE#4208] / [Intel XE#4618]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][96] -> [SKIP][97] ([Intel XE#4208] / [i915#2575]) +51 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - bat-lnl-2:          NOTRUN -> [SKIP][98] ([Intel XE#2235]) +48 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html

  * igt@kms_addfb_basic@unused-handle:
    - bat-adlp-7:         [PASS][99] -> [SKIP][100] ([Intel XE#4950]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_addfb_basic@unused-handle.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          NOTRUN -> [SKIP][101] ([Intel XE#2235] / [Intel XE#2351]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][102] -> [SKIP][103] ([Intel XE#2231] / [Intel XE#4208])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][104] -> [SKIP][105] ([Intel XE#2351]) +3 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
    - bat-lnl-2:          NOTRUN -> [SKIP][106] ([Intel XE#2351]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-lnl-1:          [PASS][107] -> [SKIP][108] ([Intel XE#2351]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-atsm-2:         [PASS][109] -> [SKIP][110] ([i915#2575]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_compute_mode@twice-preempt-fence-early:
    - bat-adlp-7:         [PASS][111] -> [SKIP][112] ([Intel XE#4945]) +27 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][113] -> [SKIP][114] ([Intel XE#4208]) +149 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][115] -> [FAIL][116] ([Intel XE#3099]) +6 other tests fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         [PASS][117] -> [FAIL][118] ([Intel XE#3099]) +3 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][119] -> [FAIL][120] ([Intel XE#4208])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - bat-lnl-2:          [ABORT][121] ([Intel XE#4830] / [Intel XE#4899]) -> [SKIP][122] ([Intel XE#4618])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][123] ([Intel XE#623]) -> [SKIP][124] ([Intel XE#4208] / [i915#2575])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][125] ([i915#6077]) -> [SKIP][126] ([i915#2575]) +30 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][127] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][128] ([i915#2575]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][129] ([Intel XE#455]) -> [SKIP][130] ([Intel XE#2231] / [Intel XE#4208])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-lnl-1:          [SKIP][131] ([Intel XE#2244]) -> [SKIP][132] ([Intel XE#2351])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][133] ([Intel XE#455]) -> [SKIP][134] ([Intel XE#2351])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][135] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][136] ([i915#2575]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][137] ([Intel XE#540]) -> [SKIP][138] ([i915#2575]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][139] ([i915#1836]) -> [SKIP][140] ([i915#2575]) +6 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][141] ([Intel XE#780]) -> [SKIP][142] ([i915#2575])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_prop_blob@basic.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][143] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][144] ([Intel XE#2231] / [Intel XE#4208]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][145] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][146] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][147] ([Intel XE#288]) -> [SKIP][148] ([Intel XE#4208]) +32 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         [SKIP][149] ([Intel XE#288]) -> [SKIP][150] ([Intel XE#4945]) +4 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][151] ([Intel XE#255]) -> [SKIP][152] ([Intel XE#4208])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [SKIP][153] ([Intel XE#2229] / [Intel XE#455]) -> [FAIL][154] ([Intel XE#3099]) +2 other tests fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       [SKIP][155] ([Intel XE#2229]) -> [FAIL][156] ([Intel XE#3099])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         [SKIP][157] ([Intel XE#2229]) -> [FAIL][158] ([Intel XE#3099])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][159] ([Intel XE#977]) -> [SKIP][160] ([Intel XE#4208])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][161] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][162] ([Intel XE#4208])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       [SKIP][163] ([Intel XE#979]) -> [SKIP][164] ([Intel XE#4208])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-dg2-oem2:       [SKIP][165] ([Intel XE#3342]) -> [SKIP][166] ([Intel XE#4208])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4830
  [Intel XE#4899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4899
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345 -> xe-pw-148394v1

  IGT_8342: 8342
  xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345: 5ee9d7c2aac6950c88c9eaf9002761ce4c430345
  xe-pw-148394v1: 148394v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/index.html

--===============5536653658304797405==
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
<tr><td><b>Series:</b></td><td>Introducing firmware late binding</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148394/">https://patchwork.freedesktop.org/series/148394/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345_BAT -&gt; xe-pw-148394v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148394v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-148394v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-148394v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +193 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">SKIP</a> +154 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> +218 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> +157 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-vf/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-vf/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-2/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_module_load@load.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148394v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-base.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +3 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_addfb_basic@unused-handle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-preempt-fence-early:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_compute_mode@twice-preempt-fence-early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4830">Intel XE#4830</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4899">Intel XE#4899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148394v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345 -&gt; xe-pw-148394v1</li>
</ul>
<p>IGT_8342: 8342<br />
  xe-3004-5ee9d7c2aac6950c88c9eaf9002761ce4c430345: 5ee9d7c2aac6950c88c9eaf9002761ce4c430345<br />
  xe-pw-148394v1: 148394v1</p>

</body>
</html>

--===============5536653658304797405==--
