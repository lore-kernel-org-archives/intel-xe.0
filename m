Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F937C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 17:06:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C278B10EA1D;
	Fri,  3 Nov 2023 17:06:28 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 485E710EA1D;
 Fri,  3 Nov 2023 17:06:26 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 43C7CAADD5;
 Fri,  3 Nov 2023 17:06:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1738707442562632948=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 03 Nov 2023 17:06:26 -0000
Message-ID: <169903118624.29107.5310748650390123075@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103154309.402159-5-matthew.auld@intel.com>
In-Reply-To: <20231103154309.402159-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_PAT_and_c?=
 =?utf-8?q?ache_coherency_support_=28rev11=29?=
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

--===============1738707442562632948==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev11)
URL   : https://patchwork.freedesktop.org/series/123027/
State : failure

== Summary ==

CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -> xe-pw-123027v11_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123027v11_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123027v11_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123027v11_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-dg2-oem2:       NOTRUN -> [WARN][1] +7 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-high:
    - bat-adlp-7:         [PASS][2] -> [WARN][3] +8 other tests warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@too-high.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_addfb_basic@too-high.html

  * igt@xe_evict@evict-threads-small:
    - bat-pvc-2:          [PASS][4] -> [FAIL][5] +11 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-threads-small.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-threads-small.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] +153 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          NOTRUN -> [FAIL][7] +85 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_intel_bb@offset-control:
    - bat-adlp-7:         [PASS][8] -> [FAIL][9] +125 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_intel_bb@offset-control.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_intel_bb@offset-control.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          NOTRUN -> [INCOMPLETE][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_live_ktest@bo.html
    - bat-atsm-2:         [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_live_ktest@bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:
    - bat-pvc-2:          NOTRUN -> [DMESG-WARN][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
    - bat-atsm-2:         [PASS][14] -> [DMESG-WARN][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@dmabuf:
    - bat-adlp-7:         [PASS][16] -> [INCOMPLETE][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_live_ktest@dmabuf.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_live_ktest@dmabuf.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][18] -> [FAIL][19] +88 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][20] ([Intel XE#609]) -> [FAIL][21] +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][22] ([Intel XE#282] / [i915#2017]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][24] ([Intel XE#389]) -> [FAIL][25] +3 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][26] ([Intel XE#482]) -> [FAIL][27] +3 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][28] ([Intel XE#854]) -> [FAIL][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html
    - bat-dg2-oem2:       NOTRUN -> [FAIL][30] +7 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html

  * {igt@xe_evict_ccs@evict-ccs-overcommit-simple}:
    - bat-pvc-2:          [PASS][31] -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html

  * {igt@xe_exec_basic@twice-bindexecqueue}:
    - bat-adlp-7:         [PASS][33] -> [FAIL][34] +5 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][35] -> [FAIL][36] +7 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          NOTRUN -> [FAIL][37] +11 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-123027v11_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
    - bat-pvc-2:          NOTRUN -> [SKIP][38] ([i915#6077]) +33 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html

  * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][39] ([Intel XE#609])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][40] ([Intel XE#623])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-pvc-2:          NOTRUN -> [SKIP][41] ([Intel XE#782]) +5 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][42] ([Intel XE#784])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][43] ([Intel XE#423])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-pvc-2:          NOTRUN -> [SKIP][44] ([Intel XE#541]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-pvc-2:          NOTRUN -> [SKIP][45] ([Intel XE#540]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][46] ([i915#5274])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][47] ([Intel XE#783])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-pvc-2:          NOTRUN -> [SKIP][48] ([Intel XE#829]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-pvc-2:          NOTRUN -> [SKIP][49] ([Intel XE#780])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-pvc-2:          NOTRUN -> [SKIP][50] ([Intel XE#535]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_psr@primary_page_flip.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][51] ([Intel XE#535]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][52] ([Intel XE#672])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][53] ([Intel XE#533]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][54] ([Intel XE#255])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][55] ([Intel XE#255])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][56] ([Intel XE#532])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][57] ([Intel XE#868])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][58] ([Intel XE#531])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Possible fixes ####

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][59] ([Intel XE#524]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/533
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/854
  [Intel XE#868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/868
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7570 -> IGT_7573
  * Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -> xe-pw-123027v11

  IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2
  xe-pw-123027v11: 123027v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/index.html

--===============1738707442562632948==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123027/">https://patchwork.freedesktop.org/series/123027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2_BAT -&gt; xe-pw-123027v11_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123027v11_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123027v11_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123027v11_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-high:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@too-high.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_addfb_basic@too-high.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-threads-small.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +153 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +85 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_intel_bb@offset-control.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_intel_bb@offset-control.html">FAIL</a> +125 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_live_ktest@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_live_ktest@dmabuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/854">Intel XE#854</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_evict_ccs@evict-ccs-overcommit-parallel-nofree-samefd.html">FAIL</a> +7 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_evict_ccs@evict-ccs-overcommit-simple}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_evict_ccs@evict-ccs-overcommit-simple.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@twice-bindexecqueue}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-adlp-7/igt@xe_exec_basic@twice-bindexecqueue.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123027v11_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-legacy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_flip@basic-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_guc_pc@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/533">Intel XE#533</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>
<p>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</p>
</li>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-dg2-oem2/igt@xe_live_ktest@bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/868">Intel XE#868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>{igt@xe_create@create-execqueues-leak}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v11/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7570 -&gt; IGT_7573</li>
<li>Linux: xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2 -&gt; xe-pw-123027v11</li>
</ul>
<p>IGT_7570: 1cd44e96b0419e00b9a09f8ead1369eab432d4f9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7573: 69485d223b256208614e9949a4a7e84bde52d5f5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-467-58dfdb8dc78e5668f9891c798ec3191863c1e0d2: 58dfdb8dc78e5668f9891c798ec3191863c1e0d2<br />
  xe-pw-123027v11: 123027v11</p>

</body>
</html>

--===============1738707442562632948==--
