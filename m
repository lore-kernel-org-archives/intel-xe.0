Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46243C4332F
	for <intel-xe@archiver.kernel.org>; Fri, 10 Nov 2023 16:45:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1701410E11F;
	Fri, 10 Nov 2023 16:45:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id EF76110E11F;
 Fri, 10 Nov 2023 16:45:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id C6A3EA7DFB;
 Fri, 10 Nov 2023 16:45:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5283293642686482223=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 10 Nov 2023 16:45:20 -0000
Message-ID: <169963472080.31676.4109865438878198664@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231110154156.6-1-francois.dugast@intel.com>
In-Reply-To: <20231110154156.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_Remove_unused_features?=
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

--===============5283293642686482223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - Remove unused features
URL   : https://patchwork.freedesktop.org/series/126278/
State : failure

== Summary ==

CI Bug Log - changes from xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce_BAT -> xe-pw-126278v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126278v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126278v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126278v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][1] -> [FAIL][2] +127 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] +177 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_module_load@load:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-adlp-7/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-adlp-7/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][7] ([Intel XE#623]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][9] ([Intel XE#624]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][11] ([i915#6077]) -> [FAIL][12] +33 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][13] ([Intel XE#609]) -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         [SKIP][15] ([Intel XE#782]) -> [FAIL][16] +5 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][17] ([Intel XE#784]) -> [FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#423]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][21] ([Intel XE#541]) -> [FAIL][22] +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][23] ([Intel XE#540]) -> [FAIL][24] +3 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][25] ([i915#5274]) -> [FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#608]) -> [FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         [SKIP][29] ([Intel XE#783]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][31] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         [SKIP][33] ([i915#1836]) -> [FAIL][34] +6 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][35] ([Intel XE#780]) -> [FAIL][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_prop_blob@basic.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         [SKIP][37] ([Intel XE#535]) -> [FAIL][38] +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_psr@cursor_plane_move.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#535]) -> [FAIL][40] +2 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         [SKIP][41] ([Intel XE#672]) -> [FAIL][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_compute@compute-square.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_compute@compute-square.html
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#672]) -> [FAIL][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_compute@compute-square.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       [SKIP][45] ([Intel XE#288]) -> [FAIL][46] +17 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         [SKIP][47] ([Intel XE#288]) -> [FAIL][48] +17 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][49] ([Intel XE#255]) -> [FAIL][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         [SKIP][51] ([Intel XE#255]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_huc_copy@huc_copy.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][53] ([Intel XE#524]) -> [FAIL][54] +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][55] -> [FAIL][56] +16 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [PASS][57] -> [FAIL][58] +14 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-dg2-oem2:       [SKIP][59] ([Intel XE#288]) -> [FAIL][60] +14 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:
    - bat-atsm-2:         [SKIP][61] ([Intel XE#288]) -> [FAIL][62] +14 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7581 -> IGT_7582
  * Linux: xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce -> xe-pw-126278v1

  IGT_7581: 7581
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce: b3890fb4386dcef68a96888141c4cc773f6241ce
  xe-pw-126278v1: 126278v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/index.html

--===============5283293642686482223==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - Remove unused features</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126278/">https://patchwork.freedesktop.org/series/126278/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce_BAT -&gt; xe-pw-126278v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126278v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126278v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126278v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> +127 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +177 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-adlp-7/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_prop_blob@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_compute@compute-square.html">FAIL</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">FAIL</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126278v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html">FAIL</a> +14 other tests fail</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7581 -&gt; IGT_7582</li>
<li>Linux: xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce -&gt; xe-pw-126278v1</li>
</ul>
<p>IGT_7581: 7581<br />
  IGT_7582: 453b9df12fbc9fff561bdb4eb97992983e74c3d4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-485-b3890fb4386dcef68a96888141c4cc773f6241ce: b3890fb4386dcef68a96888141c4cc773f6241ce<br />
  xe-pw-126278v1: 126278v1</p>

</body>
</html>

--===============5283293642686482223==--
