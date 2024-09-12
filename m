Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AEDEE644D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 06:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C4810EADE;
	Thu, 12 Sep 2024 06:41:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF4E010EADE;
 Thu, 12 Sep 2024 06:41:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7739822214638180176=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Some_correction_in_the_DP_Link_T?=
 =?utf-8?q?raining_dequence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 06:41:42 -0000
Message-ID: <172612330284.989880.16809862770076824732@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912050552.779356-1-arun.r.murthy@intel.com>
In-Reply-To: <20240912050552.779356-1-arun.r.murthy@intel.com>
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

--===============7739822214638180176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Some correction in the DP Link Training dequence
URL   : https://patchwork.freedesktop.org/series/138551/
State : success

== Summary ==

CI Bug Log - changes from xe-1931-21b08eea4582e996db65c3afa82431e756a9875b_BAT -> xe-pw-138551v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (0 -> 8)
------------------------------

  Additional (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 

Known issues
------------

  Here are the changes found in xe-pw-138551v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@eof:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#2134]) +4 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@fbdev@eof.html
    - bat-lnl-2:          NOTRUN -> [SKIP][2] ([Intel XE#2134]) +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@fbdev@eof.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-bmg-1:          NOTRUN -> [SKIP][3] ([Intel XE#2233])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-2:          NOTRUN -> [SKIP][4] ([Intel XE#1466] / [Intel XE#2235])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-lnl-1:          NOTRUN -> [SKIP][5] ([Intel XE#1466])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][6] ([Intel XE#623])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([i915#6077]) +30 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-adlp-vf:        NOTRUN -> [SKIP][8] ([Intel XE#2461]) +30 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         NOTRUN -> [SKIP][9] ([Intel XE#1024] / [Intel XE#782]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-lnl-2:          NOTRUN -> [SKIP][10] ([Intel XE#2235]) +13 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][11] ([Intel XE#2244])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][12] ([Intel XE#455])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([Intel XE#1024] / [Intel XE#784])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html
    - bat-lnl-1:          NOTRUN -> [SKIP][14] ([Intel XE#599])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html
    - bat-adlp-7:         NOTRUN -> [SKIP][15] ([Intel XE#455])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          NOTRUN -> [SKIP][16] ([Intel XE#2235] / [Intel XE#2482]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-vf:        NOTRUN -> [SKIP][17] ([Intel XE#2463]) +14 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([Intel XE#1024] / [Intel XE#947]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          NOTRUN -> [SKIP][19] ([Intel XE#352]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#540]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@force-edid:
    - bat-lnl-2:          NOTRUN -> [SKIP][21] ([Intel XE#2235] / [Intel XE#352]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-adlp-vf:        NOTRUN -> [SKIP][22] ([Intel XE#540]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_force_connector_basic@prune-stale-modes.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][23] ([i915#5274])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         NOTRUN -> [FAIL][24] ([Intel XE#1861])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-lnl-2:          NOTRUN -> [SKIP][25] ([Intel XE#2235] / [Intel XE#2548])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][26] ([Intel XE#1024] / [Intel XE#783])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          NOTRUN -> [SKIP][27] ([Intel XE#1470])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-2:          NOTRUN -> [SKIP][28] ([Intel XE#1470] / [Intel XE#2235])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         NOTRUN -> [SKIP][29] ([i915#1836]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
    - bat-adlp-vf:        NOTRUN -> [SKIP][30] ([Intel XE#829]) +6 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html

  * igt@kms_prop_blob@basic:
    - bat-adlp-vf:        NOTRUN -> [SKIP][31] ([Intel XE#780])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_prop_blob@basic.html
    - bat-atsm-2:         NOTRUN -> [SKIP][32] ([Intel XE#780])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          NOTRUN -> [SKIP][33] ([Intel XE#929]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][34] ([Intel XE#929]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         NOTRUN -> [SKIP][35] ([Intel XE#1024]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][36] ([Intel XE#2234]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-bmg-1:          NOTRUN -> [SKIP][37] ([Intel XE#1091]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][38] ([Intel XE#2460]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-2:          NOTRUN -> [SKIP][39] ([Intel XE#1091]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-1:          NOTRUN -> [SKIP][40] ([Intel XE#1091]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][41] ([Intel XE#1091]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-vf:        NOTRUN -> [SKIP][42] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-small-cm:
    - bat-adlp-7:         NOTRUN -> [SKIP][43] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html
    - bat-lnl-2:          NOTRUN -> [SKIP][44] ([Intel XE#688]) +17 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_evict@evict-small-cm.html

  * igt@xe_evict@evict-threads-small:
    - bat-lnl-1:          NOTRUN -> [SKIP][45] ([Intel XE#688]) +17 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_evict@evict-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-7:         NOTRUN -> [SKIP][46] ([Intel XE#688]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][47] ([Intel XE#688]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          NOTRUN -> [FAIL][48] ([Intel XE#1069])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][49] ([Intel XE#288]) +32 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - bat-adlp-vf:        NOTRUN -> [SKIP][50] ([Intel XE#288]) +32 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][51] ([Intel XE#288]) +32 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][52] ([Intel XE#288]) +32 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_gt_freq@freq_range_idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][53] ([Intel XE#2464]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][54] ([Intel XE#255])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][55] ([Intel XE#255])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][56] ([Intel XE#2229]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][57] ([Intel XE#2229]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][58] ([Intel XE#2229]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-1:          NOTRUN -> [SKIP][59] ([Intel XE#2229])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][60] ([Intel XE#2229])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][61] ([Intel XE#2229]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][62] ([Intel XE#2229]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][63] ([Intel XE#1008])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_mmap@vram.html
    - bat-lnl-2:          NOTRUN -> [SKIP][64] ([Intel XE#1416])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_mmap@vram.html
    - bat-lnl-1:          NOTRUN -> [SKIP][65] ([Intel XE#1416])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_mmap@vram.html
    - bat-adlp-7:         NOTRUN -> [SKIP][66] ([Intel XE#1008])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][67] ([Intel XE#977])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         NOTRUN -> [SKIP][68] ([Intel XE#977])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][69] ([Intel XE#977])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][70] ([Intel XE#977])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          NOTRUN -> [SKIP][71] ([Intel XE#1420])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][72] ([Intel XE#979]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][73] ([Intel XE#979]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          NOTRUN -> [SKIP][74] ([Intel XE#1420])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][75] ([Intel XE#979]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          NOTRUN -> [SKIP][76] ([Intel XE#1420])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-1:          NOTRUN -> [SKIP][77] ([Intel XE#2245])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          NOTRUN -> [SKIP][78] ([Intel XE#977])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          NOTRUN -> [SKIP][79] ([Intel XE#977])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vf:        NOTRUN -> [SKIP][80] ([Intel XE#979]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          NOTRUN -> [SKIP][81] ([Intel XE#979])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][82] ([Intel XE#2236])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          NOTRUN -> [SKIP][83] ([Intel XE#2236] / [Intel XE#979])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][84] ([Intel XE#2468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2489
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-1931-21b08eea4582e996db65c3afa82431e756a9875b -> xe-pw-138551v1

  IGT_8013: 8013
  xe-1931-21b08eea4582e996db65c3afa82431e756a9875b: 21b08eea4582e996db65c3afa82431e756a9875b
  xe-pw-138551v1: 138551v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/index.html

--===============7739822214638180176==
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
<tr><td><b>Series:</b></td><td>Some correction in the DP Link Training dequence</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138551/">https://patchwork.freedesktop.org/series/138551/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1931-21b08eea4582e996db65c3afa82431e756a9875b_BAT -&gt; xe-pw-138551v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (0 -&gt; 8)</h2>
<p>Additional (8): bat-bmg-1 bat-lnl-2 bat-adlp-vf bat-lnl-1 bat-dg2-oem2 bat-atsm-2 bat-bmg-2 bat-adlp-7 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138551v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>) +14 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460">Intel XE#2460</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_evict@evict-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_range_idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_gt_freq@freq_range_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138551v1/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1931-21b08eea4582e996db65c3afa82431e756a9875b -&gt; xe-pw-138551v1</li>
</ul>
<p>IGT_8013: 8013<br />
  xe-1931-21b08eea4582e996db65c3afa82431e756a9875b: 21b08eea4582e996db65c3afa82431e756a9875b<br />
  xe-pw-138551v1: 138551v1</p>

</body>
</html>

--===============7739822214638180176==--
