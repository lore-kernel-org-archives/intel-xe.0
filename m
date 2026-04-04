Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E358E88D70
	for <intel-xe@archiver.kernel.org>; Sat,  4 Apr 2026 07:12:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6D010E231;
	Sat,  4 Apr 2026 07:12:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB1010E166;
 Sat,  4 Apr 2026 07:12:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3418553231761999268=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Wait_for_HW_clear?=
 =?utf-8?q?ance_before_issuing_the_next_TLB_inval=2E_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: fei.yang@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 04 Apr 2026 07:12:37 -0000
Message-ID: <177528675713.431931.16976211848337757220@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260404062250.3435419-1-fei.yang@intel.com>
In-Reply-To: <20260404062250.3435419-1-fei.yang@intel.com>
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

--===============3418553231761999268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Wait for HW clearance before issuing the next TLB inval. (rev2)
URL   : https://patchwork.freedesktop.org/series/163417/
State : failure

== Summary ==

CI Bug Log - changes from xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8_BAT -> xe-pw-163417v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163417v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163417v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 12)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163417v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
    - bat-lnl-2:          [PASS][1] -> [SKIP][2] +158 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-ptl-2/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-ptl-2/igt@xe_module_load@load.html
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-atsm-2:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-atsm-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-atsm-2/igt@xe_module_load@load.html
    - bat-wcl-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-wcl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-wcl-1/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-ptl-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-ptl-1/igt@xe_module_load@load.html
    - bat-wcl-2:          [PASS][13] -> [ABORT][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-wcl-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-wcl-2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-2:          [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-2/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-2/igt@xe_module_load@load.html
    - bat-bmg-3:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-3/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-3/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][21] -> [ABORT][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-1/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-1/igt@xe_module_load@load.html
    - bat-adlp-7:         [PASS][23] -> [ABORT][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-adlp-7/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-adlp-7/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][25] -> [DMESG-FAIL][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#2235] / [Intel XE#2482]) -> [SKIP][28] +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-2:          [SKIP][29] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][30] +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small:
    - bat-lnl-2:          [SKIP][31] ([Intel XE#6540] / [Intel XE#688]) -> [SKIP][32] +11 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_evict@evict-beng-small.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          [SKIP][33] ([Intel XE#7482]) -> [SKIP][34] +17 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_mmap@vram:
    - bat-lnl-2:          [SKIP][35] ([Intel XE#1416]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_mmap@vram.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-2:          [SKIP][37] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-2:          [SKIP][39] ([Intel XE#7590] / [Intel XE#977]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-2:          [SKIP][41] ([Intel XE#2236] / [Intel XE#7590] / [Intel XE#979]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          [SKIP][43] ([Intel XE#3342]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-163417v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [PASS][45] -> [SKIP][46] ([Intel XE#2235]) +30 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][47] -> [FAIL][48] ([Intel XE#7553]) +4 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][49] ([Intel XE#1466] / [Intel XE#2235]) -> [SKIP][50] ([Intel XE#2235])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          [SKIP][51] ([Intel XE#2235]) -> [SKIP][52] ([Intel XE#2235] / [Intel XE#2351])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_dsc@dsc-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-2:          [SKIP][53] ([Intel XE#2235] / [Intel XE#352]) -> [SKIP][54] ([Intel XE#2235]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][55] ([Intel XE#2235] / [Intel XE#2548]) -> [SKIP][56] ([Intel XE#2235] / [Intel XE#2351])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-2:          [SKIP][57] ([Intel XE#1470] / [Intel XE#2235] / [Intel XE#2853]) -> [SKIP][58] ([Intel XE#2235])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][59] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][60] ([Intel XE#2351]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          [SKIP][61] ([Intel XE#2229]) -> [FAIL][62] ([Intel XE#7553]) +2 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7553]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7553
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8 -> xe-pw-163417v2

  IGT_8847: 8847
  xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8: f0ef889ccb91830e573f8e61c637c5337a4ff6d8
  xe-pw-163417v2: 163417v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/index.html

--===============3418553231761999268==
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
<tr><td><b>Series:</b></td><td>drm/xe: Wait for HW clearance before issuing the next TLB inval. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163417/">https://patchwork.freedesktop.org/series/163417/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8_BAT -&gt; xe-pw-163417v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163417v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163417v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 12)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163417v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html">SKIP</a> +158 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-atsm-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-wcl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-ptl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-wcl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-wcl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-3/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-3/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-adlp-7/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-adlp-7/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163417v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7553">Intel XE#7553</a>) +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163417v2/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7553">Intel XE#7553</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8 -&gt; xe-pw-163417v2</li>
</ul>
<p>IGT_8847: 8847<br />
  xe-4850-f0ef889ccb91830e573f8e61c637c5337a4ff6d8: f0ef889ccb91830e573f8e61c637c5337a4ff6d8<br />
  xe-pw-163417v2: 163417v2</p>

</body>
</html>

--===============3418553231761999268==--
