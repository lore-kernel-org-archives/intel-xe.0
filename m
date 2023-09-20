Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A56C05022
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 20:36:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87310E559;
	Wed, 20 Sep 2023 20:36:11 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55C4510E558;
 Wed, 20 Sep 2023 20:36:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 52015A73C7;
 Wed, 20 Sep 2023 20:36:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5110689781787544520=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Wed, 20 Sep 2023 20:36:10 -0000
Message-ID: <169524217032.6465.13998903094366247471@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_take_1_v2?=
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

--===============5110689781787544520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 1 v2
URL   : https://patchwork.freedesktop.org/series/124000/
State : failure

== Summary ==

CI Bug Log - changes from xe-386-805557401e7aaeeec5aeb1de6688853390738bee_BAT -> xe-pw-124000v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-124000v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124000v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124000v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +97 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-atsm-2:         [PASS][3] -> [TIMEOUT][4] +2 other tests timeout
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_intel_bb@render@render-y-1024:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][5] +10 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_intel_bb@render@render-y-1024.html

  * igt@xe_mmio@mmio-invalid:
    - bat-adlp-7:         [PASS][6] -> [FAIL][7] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_mmio@mmio-invalid.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_mmio@mmio-invalid.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [SKIP][8] ([i915#2575]) -> [FAIL][9] +2 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [SKIP][10] ([Intel XE#678]) -> [TIMEOUT][11] +2 other tests timeout
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [SKIP][12] ([Intel XE#678]) -> [FAIL][13] +91 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [SKIP][14] ([Intel XE#678]) -> [FAIL][15] +11 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][16] -> [FAIL][17] +11 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-124000v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - bat-adlp-7:         NOTRUN -> [FAIL][18] ([Intel XE#716]) +12 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][19] -> [FAIL][20] ([Intel XE#716]) +155 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#679]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-modifier-no-flag:
    - bat-dg2-oem2:       [SKIP][23] ([i915#2575]) -> [PASS][24] +48 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [FAIL][25] -> [PASS][26] +4 other tests pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#681]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_query@query-invalid-query:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#678]) -> [PASS][30] +36 other tests pass
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_query@query-invalid-query.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_query@query-invalid-query.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-oem2:       [SKIP][31] ([i915#2575]) -> [FAIL][32] ([Intel XE#609])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][33] ([i915#2575]) -> [SKIP][34] ([Intel XE#623])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][35] ([i915#2575]) -> [SKIP][36] ([Intel XE#624])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][37] ([Intel XE#609]) -> [FAIL][38] ([Intel XE#716]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#678]) -> [SKIP][40] ([Intel XE#423])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         [SKIP][41] ([Intel XE#423]) -> [FAIL][42] ([Intel XE#716])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][43] ([i915#2575]) -> [SKIP][44] ([i915#5274])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][45] ([Intel XE#632]) -> [FAIL][46] ([Intel XE#716])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][47] ([Intel XE#678]) -> [SKIP][48] ([i915#1072]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       [SKIP][49] ([Intel XE#678]) -> [SKIP][50] ([Intel XE#672])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         [SKIP][51] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][52] ([Intel XE#716]) +15 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][53] ([Intel XE#678]) -> [SKIP][54] ([Intel XE#288]) +17 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][55] ([Intel XE#288]) -> [FAIL][56] ([Intel XE#716]) +17 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][57] ([Intel XE#678]) -> [SKIP][58] ([Intel XE#255])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][59] ([Intel XE#263]) -> [FAIL][60] ([Intel XE#716])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_mmap@vram.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_mmap@vram.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#678]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/678
  [Intel XE#679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/679
  [Intel XE#681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/681
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#716]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/716
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-386-805557401e7aaeeec5aeb1de6688853390738bee -> xe-pw-124000v1

  IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-386-805557401e7aaeeec5aeb1de6688853390738bee: 805557401e7aaeeec5aeb1de6688853390738bee
  xe-pw-124000v1: 124000v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/index.html

--===============5110689781787544520==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 1 v2</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124000/">https://patchwork.freedesktop.org/series/124000/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-386-805557401e7aaeeec5aeb1de6688853390738bee_BAT -&gt; xe-pw-124000v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-124000v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124000v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124000v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render@render-y-1024:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_intel_bb@render@render-y-1024.html">FAIL</a> +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmio@mmio-invalid:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_mmio@mmio-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_mmio@mmio-invalid.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +91 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124000v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +12 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +155 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/679">Intel XE#679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-modifier-no-flag:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-modifier-no-flag.html">PASS</a> +48 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_live_ktest@bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/681">Intel XE#681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-query:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_query@query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_query@query-invalid-query.html">PASS</a> +36 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/678">Intel XE#678</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-386-805557401e7aaeeec5aeb1de6688853390738bee/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124000v1/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-386-805557401e7aaeeec5aeb1de6688853390738bee -&gt; xe-pw-124000v1</li>
</ul>
<p>IGT_7494: 8b5be5770319f47d71782bc89e4738aa63d6906d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-386-805557401e7aaeeec5aeb1de6688853390738bee: 805557401e7aaeeec5aeb1de6688853390738bee<br />
  xe-pw-124000v1: 124000v1</p>

</body>
</html>

--===============5110689781787544520==--
