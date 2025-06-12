Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070AFC7113E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 06:39:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3F810E757;
	Thu, 12 Jun 2025 06:39:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F19510E722;
 Thu, 12 Jun 2025 06:39:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7010078659187401775=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_xe=5Flate=5Fbind_?=
 =?utf-8?q?squash_for_CI_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 06:39:45 -0000
Message-ID: <174971038511.70048.261059737765786165@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610185455.1612731-1-badal.nilawar@intel.com>
In-Reply-To: <20250610185455.1612731-1-badal.nilawar@intel.com>
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

--===============7010078659187401775==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: xe_late_bind squash for CI (rev2)
URL   : https://patchwork.freedesktop.org/series/150059/
State : failure

== Summary ==

CI Bug Log - changes from xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b_BAT -> xe-pw-150059v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150059v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150059v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150059v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-atsm-2:         [PASS][5] -> [SKIP][6] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][7] +187 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-atsm-2:         NOTRUN -> [FAIL][8] +7 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][9] -> [FAIL][10] +4 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - bat-lnl-1:          [PASS][11] -> [FAIL][12] +5 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][13] -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][17] -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][19] -> [DMESG-FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][21] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][23] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][25] ([Intel XE#1024]) -> [SKIP][26] +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#2229]) -> [FAIL][28] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_live_ktest@xe_bo.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-lnl-1:          [SKIP][29] ([Intel XE#2229]) -> [FAIL][30] +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-150059v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         NOTRUN -> [SKIP][31] ([Intel XE#4963])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][32] -> [SKIP][33] ([Intel XE#4963])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][34] -> [SKIP][35] ([Intel XE#4963])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - bat-dg2-oem2:       [PASS][36] -> [SKIP][37] ([Intel XE#2134]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@fbdev@eof.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@fbdev@eof.html

  * igt@fbdev@info:
    - bat-lnl-1:          [PASS][38] -> [SKIP][39] ([Intel XE#2134]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@fbdev@info.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@fbdev@info.html

  * igt@fbdev@read:
    - bat-adlp-7:         [PASS][40] -> [SKIP][41] ([Intel XE#2134]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@fbdev@read.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@fbdev@read.html

  * igt@intel_sysfs_debugfs@xe-forcewake:
    - bat-adlp-7:         [PASS][42] -> [SKIP][43] ([Intel XE#4618] / [Intel XE#4945]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - bat-lnl-2:          [PASS][44] -> [SKIP][45] ([Intel XE#4618] / [Intel XE#4945]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-lnl-1:          [PASS][46] -> [SKIP][47] ([Intel XE#4618] / [Intel XE#4945]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
    - bat-dg2-oem2:       [PASS][48] -> [SKIP][49] ([Intel XE#4208] / [Intel XE#4618]) +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][50] -> [SKIP][51] ([Intel XE#4208] / [i915#2575]) +51 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_addfb_basic@bad-pitch-63:
    - bat-lnl-1:          [PASS][52] -> [SKIP][53] ([Intel XE#4950]) +47 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - bat-lnl-2:          [PASS][54] -> [SKIP][55] ([Intel XE#2235] / [Intel XE#4950]) +30 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html

  * igt@kms_addfb_basic@invalid-set-prop:
    - bat-adlp-7:         [PASS][56] -> [SKIP][57] ([Intel XE#4950]) +53 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][58] -> [SKIP][59] ([Intel XE#2231] / [Intel XE#4208])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][60] -> [SKIP][61] ([Intel XE#2351] / [Intel XE#4947]) +3 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
    - bat-lnl-1:          [PASS][62] -> [SKIP][63] ([Intel XE#2351]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-atsm-2:         [PASS][64] -> [SKIP][65] ([i915#2575])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          [PASS][66] -> [SKIP][67] ([Intel XE#4945]) +169 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-lnl-1:          [PASS][68] -> [SKIP][69] ([Intel XE#4945]) +169 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_huc_copy@huc_copy.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][70] -> [SKIP][71] ([Intel XE#4208]) +149 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         NOTRUN -> [SKIP][72] ([Intel XE#4945]) +186 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][73] -> [FAIL][74] ([Intel XE#3099]) +6 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         NOTRUN -> [FAIL][75] ([Intel XE#3099]) +7 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][76] ([Intel XE#1466] / [Intel XE#2235]) -> [SKIP][77] ([Intel XE#2235] / [Intel XE#4950])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-1:          [SKIP][78] ([Intel XE#1466]) -> [SKIP][79] ([Intel XE#4950])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       [SKIP][80] ([Intel XE#623]) -> [SKIP][81] ([Intel XE#4208] / [i915#2575])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][82] ([i915#6077]) -> [SKIP][83] ([i915#2575]) +30 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][84] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][85] ([i915#2575]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-2:          [SKIP][86] ([Intel XE#2235]) -> [SKIP][87] ([Intel XE#2235] / [Intel XE#4950]) +12 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          [SKIP][88] ([Intel XE#2235]) -> [SKIP][89] ([Intel XE#2235] / [Intel XE#2351])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_dsc@dsc-basic.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][90] ([Intel XE#455]) -> [SKIP][91] ([Intel XE#2231] / [Intel XE#4208])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-lnl-1:          [SKIP][92] ([Intel XE#2244]) -> [SKIP][93] ([Intel XE#2351])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_dsc@dsc-basic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][94] ([Intel XE#455]) -> [SKIP][95] ([Intel XE#2351] / [Intel XE#4947])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][96] ([Intel XE#2235] / [Intel XE#2482]) -> [SKIP][97] ([Intel XE#4950]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][98] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][99] ([i915#2575]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          [SKIP][100] ([Intel XE#352]) -> [SKIP][101] ([Intel XE#4950]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
    - bat-atsm-2:         [SKIP][102] ([Intel XE#540]) -> [SKIP][103] ([i915#2575]) +3 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-lnl-2:          [SKIP][104] ([Intel XE#2235] / [Intel XE#352]) -> [SKIP][105] ([Intel XE#2235] / [Intel XE#4950]) +2 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][106] ([Intel XE#2235] / [Intel XE#2548]) -> [SKIP][107] ([Intel XE#2235] / [Intel XE#2351])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          [SKIP][108] ([Intel XE#1470] / [Intel XE#2853]) -> [SKIP][109] ([Intel XE#4950])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-2:          [SKIP][110] ([Intel XE#1470] / [Intel XE#2235] / [Intel XE#2853]) -> [SKIP][111] ([Intel XE#2235] / [Intel XE#4950])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][112] ([i915#1836]) -> [SKIP][113] ([i915#2575]) +6 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][114] ([Intel XE#780]) -> [SKIP][115] ([i915#2575])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_prop_blob@basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][116] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][117] ([Intel XE#2351]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-dg2-oem2:       [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][119] ([Intel XE#2231] / [Intel XE#4208]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-2:          [SKIP][120] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][121] ([Intel XE#4950]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-1:          [SKIP][122] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][123] ([Intel XE#4950]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       [SKIP][124] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][125] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [ABORT][126] ([Intel XE#5214]) -> [SKIP][127] ([Intel XE#4950])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
    - bat-atsm-2:         [ABORT][128] ([Intel XE#5214]) -> [SKIP][129] ([i915#2575])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@xe_evict@evict-small-cm:
    - bat-lnl-2:          [SKIP][130] ([Intel XE#688]) -> [SKIP][131] ([Intel XE#4945]) +11 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_evict@evict-small-cm.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-lnl-1:          [SKIP][132] ([Intel XE#688]) -> [SKIP][133] ([Intel XE#4945]) +11 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][134] ([Intel XE#288]) -> [SKIP][135] ([Intel XE#4208]) +32 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][136] ([Intel XE#255]) -> [SKIP][137] ([Intel XE#4208])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       [SKIP][138] ([Intel XE#2229]) -> [FAIL][139] ([Intel XE#3099])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-2:          [SKIP][140] ([Intel XE#1416]) -> [SKIP][141] ([Intel XE#4945])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_mmap@vram.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_mmap@vram.html
    - bat-lnl-1:          [SKIP][142] ([Intel XE#1416]) -> [SKIP][143] ([Intel XE#4945])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_mmap@vram.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][144] ([Intel XE#977]) -> [SKIP][145] ([Intel XE#4208])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][146] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][147] ([Intel XE#4945])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][148] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][149] ([Intel XE#4208])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][150] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][151] ([Intel XE#4945])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-2:          [SKIP][152] ([Intel XE#977]) -> [SKIP][153] ([Intel XE#4945])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][154] ([Intel XE#977]) -> [SKIP][155] ([Intel XE#4945])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][156] ([Intel XE#979]) -> [SKIP][157] ([Intel XE#4945])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       [SKIP][158] ([Intel XE#979]) -> [SKIP][159] ([Intel XE#4208])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][160] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][161] ([Intel XE#4945])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          [SKIP][162] ([Intel XE#3342]) -> [SKIP][163] ([Intel XE#4945])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-lnl-1:          [SKIP][164] ([Intel XE#3342]) -> [SKIP][165] ([Intel XE#4945])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-dg2-oem2:       [SKIP][166] ([Intel XE#3342]) -> [SKIP][167] ([Intel XE#4208])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html

  
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
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
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
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214
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

  * Linux: xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b -> xe-pw-150059v2

  IGT_8405: 8405
  xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b: 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b
  xe-pw-150059v2: 150059v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/index.html

--===============7010078659187401775==
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
<tr><td><b>Series:</b></td><td>drm/xe: xe_late_bind squash for CI (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150059/">https://patchwork.freedesktop.org/series/150059/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b_BAT -&gt; xe-pw-150059v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150059v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150059v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150059v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> +187 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@xe_module_load@load.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_module_load@load.html">FAIL</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_live_ktest@xe_bo.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150059v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@fbdev@eof.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-forcewake:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@intel_sysfs_debugfs@xe-forcewake.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +3 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-63:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_addfb_basic@bad-pitch-63.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_addfb_basic@invalid-get-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_addfb_basic@invalid-set-prop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +53 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +169 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +169 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +149 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_intel_bb@offset-control.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +186 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +7 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5214">Intel XE#5214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150059v2/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b -&gt; xe-pw-150059v2</li>
</ul>
<p>IGT_8405: 8405<br />
  xe-3236-03848f8a962392d602e7f2a6a22f2a7e3efa4a3b: 03848f8a962392d602e7f2a6a22f2a7e3efa4a3b<br />
  xe-pw-150059v2: 150059v2</p>

</body>
</html>

--===============7010078659187401775==--
