Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8F0CCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 17:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 010C610EB26;
	Fri,  7 Nov 2025 17:07:25 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDAF610EB25;
 Fri,  7 Nov 2025 17:07:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5581692248625020489=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Enable_VF_reso?=
 =?utf-8?q?urce_fixup_unconditionally?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Nov 2025 17:07:24 -0000
Message-ID: <176253524476.29335.6823837019799354504@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251107161000.1938186-1-michal.winiarski@intel.com>
In-Reply-To: <20251107161000.1938186-1-michal.winiarski@intel.com>
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

--===============5581692248625020489==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Enable VF resource fixup unconditionally
URL   : https://patchwork.freedesktop.org/series/157241/
State : success

== Summary ==

CI Bug Log - changes from xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b_BAT -> xe-pw-157241v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157241v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_dsc@dsc-basic:
    - bat-bmg-1:          NOTRUN -> [SKIP][1] ([Intel XE#2244])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#455])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-1:          NOTRUN -> [SKIP][3] ([Intel XE#352]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          NOTRUN -> [SKIP][4] ([Intel XE#1470] / [Intel XE#2853])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          NOTRUN -> [SKIP][6] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          NOTRUN -> [SKIP][7] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          NOTRUN -> [SKIP][9] ([Intel XE#4837]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html
    - bat-lnl-2:          NOTRUN -> [SKIP][11] ([Intel XE#688]) +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_evict@evict-beng-small.html
    - bat-ptl-2:          NOTRUN -> [SKIP][12] ([Intel XE#5764]) +11 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          NOTRUN -> [SKIP][13] ([Intel XE#5764]) +11 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][14] ([Intel XE#5764]) +10 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html
    - bat-lnl-1:          NOTRUN -> [SKIP][15] ([Intel XE#688]) +11 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][16] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-adlp-7:         NOTRUN -> [SKIP][17] ([Intel XE#688]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        NOTRUN -> [SKIP][18] ([Intel XE#688])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][19] ([Intel XE#288]) +32 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#288]) +32 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][21] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][22] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][23] ([Intel XE#1021]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_huc_copy@huc_copy:
    - bat-pvc-2:          NOTRUN -> [SKIP][24] ([Intel XE#255])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][25] ([Intel XE#255])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
    - bat-atsm-2:         NOTRUN -> [SKIP][26] ([Intel XE#255])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][27] ([Intel XE#532])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          NOTRUN -> [SKIP][28] ([Intel XE#5775]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
    - bat-lnl-1:          NOTRUN -> [SKIP][29] ([Intel XE#2229]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][30] ([Intel XE#2229] / [Intel XE#455]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-lnl-2:          NOTRUN -> [SKIP][31] ([Intel XE#2229]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][32] ([Intel XE#5775]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-bmg-2:          NOTRUN -> [SKIP][33] ([Intel XE#2229])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
    - bat-bmg-1:          NOTRUN -> [SKIP][34] ([Intel XE#2229])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][35] ([Intel XE#2229])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-atsm-2:         NOTRUN -> [SKIP][36] ([Intel XE#2229])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][37] ([Intel XE#2229] / [Intel XE#5488])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-pvc-2:          NOTRUN -> [SKIP][38] ([Intel XE#2229]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][39] ([Intel XE#5775])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
    - bat-adlp-7:         NOTRUN -> [SKIP][40] ([Intel XE#2229] / [Intel XE#5488])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          NOTRUN -> [SKIP][41] ([Intel XE#5776])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_mmap@vram.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][42] ([Intel XE#5776])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_mmap@vram.html
    - bat-lnl-1:          NOTRUN -> [SKIP][43] ([Intel XE#1416])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_mmap@vram.html
    - bat-adlp-7:         NOTRUN -> [SKIP][44] ([Intel XE#1008] / [Intel XE#5591])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_mmap@vram.html
    - bat-lnl-2:          NOTRUN -> [SKIP][45] ([Intel XE#1416])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_mmap@vram.html
    - bat-ptl-2:          NOTRUN -> [SKIP][46] ([Intel XE#5776])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_mmap@vram.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][47] ([Intel XE#1008] / [Intel XE#5591])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][48] ([Intel XE#977])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html
    - bat-atsm-2:         NOTRUN -> [SKIP][49] ([Intel XE#977])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-pvc-2:          NOTRUN -> [SKIP][50] ([Intel XE#977]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         NOTRUN -> [SKIP][51] ([Intel XE#977])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][52] ([Intel XE#977])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         NOTRUN -> [SKIP][53] ([Intel XE#5777])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-1:          NOTRUN -> [SKIP][54] ([Intel XE#1420] / [Intel XE#2838])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          NOTRUN -> [SKIP][55] ([Intel XE#1420])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          NOTRUN -> [SKIP][56] ([Intel XE#1420])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         NOTRUN -> [SKIP][57] ([Intel XE#2838] / [Intel XE#979])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          NOTRUN -> [SKIP][58] ([Intel XE#1420] / [Intel XE#2838])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][59] ([Intel XE#2838] / [Intel XE#979])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          NOTRUN -> [SKIP][60] ([Intel XE#5777])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][61] ([Intel XE#2838] / [Intel XE#979])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         NOTRUN -> [SKIP][62] ([Intel XE#2838] / [Intel XE#979])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          NOTRUN -> [SKIP][63] ([Intel XE#5777])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          NOTRUN -> [SKIP][64] ([Intel XE#4578])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          NOTRUN -> [SKIP][65] ([Intel XE#2245])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          NOTRUN -> [SKIP][66] ([Intel XE#2245])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          NOTRUN -> [SKIP][67] ([Intel XE#977])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          NOTRUN -> [SKIP][68] ([Intel XE#5771])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          NOTRUN -> [SKIP][69] ([Intel XE#5771])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][70] ([Intel XE#5771])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          NOTRUN -> [SKIP][71] ([Intel XE#977])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          NOTRUN -> [SKIP][72] ([Intel XE#5780])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-vm:         NOTRUN -> [SKIP][73] ([Intel XE#5780])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          NOTRUN -> [SKIP][74] ([Intel XE#979])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-pvc-2:          NOTRUN -> [SKIP][75] ([Intel XE#979])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          NOTRUN -> [SKIP][76] ([Intel XE#2236])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          NOTRUN -> [SKIP][77] ([Intel XE#2236])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-7:         NOTRUN -> [SKIP][78] ([Intel XE#979])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          NOTRUN -> [SKIP][79] ([Intel XE#2236] / [Intel XE#979])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-adlp-vm:        NOTRUN -> [SKIP][80] ([Intel XE#979])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          NOTRUN -> [SKIP][81] ([Intel XE#5780])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][82] ([Intel XE#979])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
    - bat-atsm-2:         NOTRUN -> [SKIP][83] ([Intel XE#979])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - bat-bmg-3:          NOTRUN -> [FAIL][84] ([Intel XE#6433]) +3 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-pvc-2:          NOTRUN -> [SKIP][85] ([Intel XE#531])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          NOTRUN -> [SKIP][86] ([Intel XE#3342])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][87] ([Intel XE#3342])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-lnl-1:          NOTRUN -> [SKIP][88] ([Intel XE#3342])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-pvc-2:          NOTRUN -> [SKIP][89] ([Intel XE#3342])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [ABORT][90] ([Intel XE#6541]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-bmg-1:          [ABORT][92] ([Intel XE#6541]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [ABORT][94] ([Intel XE#6541]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
    - bat-ptl-2:          [ABORT][96] ([Intel XE#6541]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
    - bat-lnl-1:          [ABORT][98] ([Intel XE#6541]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
    - bat-lnl-1:          [DMESG-WARN][100] ([Intel XE#6541]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@c-edp1:
    - bat-ptl-2:          [DMESG-WARN][102] ([Intel XE#6541]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html

  * igt@kms_flip@basic-flip-vs-dpms@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][104] ([Intel XE#6541]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html

  * igt@xe_compute@compute-square:
    - bat-ptl-1:          [ABORT][106] ([Intel XE#6541]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-1/igt@xe_compute@compute-square.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_compute@compute-square.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-pvc-2:          [ABORT][108] ([Intel XE#6541]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html
    - bat-ptl-vm:         [ABORT][110] ([Intel XE#6541]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html
    - bat-bmg-2:          [ABORT][112] ([Intel XE#6541]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html
    - bat-lnl-2:          [ABORT][114] ([Intel XE#6541]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html
    - bat-atsm-2:         [ABORT][116] ([Intel XE#6541]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
    - bat-adlp-vm:        [ABORT][118] ([Intel XE#6541]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          [ABORT][120] ([Intel XE#6541]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#6433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433
  [Intel XE#6541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b -> xe-pw-157241v1

  IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b: e136fbf191d1dddb75f20c4c033d32e1caa0437b
  xe-pw-157241v1: 157241v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/index.html

--===============5581692248625020489==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Enable VF resource fixup unconditionally</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157241/">https://patchwork.freedesktop.org/series/157241/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b_BAT -&gt; xe-pw-157241v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157241v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +11 other tests skip</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +2 other tests skip</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) +1 other test skip</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4578">Intel XE#4578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-ptl-vm:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6433">Intel XE#6433</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-edp1:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-2/igt@kms_flip@basic-flip-vs-dpms@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms@d-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-1/igt@xe_compute@compute-square.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-1/igt@xe_compute@compute-square.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-pvc-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-ptl-vm/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-lnl-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
<li>bat-adlp-vm:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-adlp-vm/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6541">Intel XE#6541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157241v1/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b -&gt; xe-pw-157241v1</li>
</ul>
<p>IGT_8613: b542242f5b116e3b554b4068ef5dfa4451075b2b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4069-e136fbf191d1dddb75f20c4c033d32e1caa0437b: e136fbf191d1dddb75f20c4c033d32e1caa0437b<br />
  xe-pw-157241v1: 157241v1</p>

</body>
</html>

--===============5581692248625020489==--
