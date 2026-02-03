Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB77E83057
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 06:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811D388EFF;
	Tue,  3 Feb 2026 06:10:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216C388EFF;
 Tue,  3 Feb 2026 06:10:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7249510428671421597=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E58=2E1_for_LNL=2C_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Feb 2026 06:10:22 -0000
Message-ID: <177009902210.219330.17891108348768789992@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202204923.2767427-2-julia.filipchuk@intel.com>
In-Reply-To: <20260202204923.2767427-2-julia.filipchuk@intel.com>
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

--===============7249510428671421597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.58.1 for LNL, PTL
URL   : https://patchwork.freedesktop.org/series/161033/
State : failure

== Summary ==

CI Bug Log - changes from xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4_BAT -> xe-pw-161033v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161033v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161033v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-ptl-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161033v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@unused-offsets:
    - bat-ptl-1:          [PASS][1] -> [SKIP][2] +189 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html

  * igt@xe_exec_balancer@no-exec-virtual-basic:
    - bat-lnl-2:          [PASS][3] -> [SKIP][4] +176 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-lnl-2:          [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-ptl-2:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-2/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-2/igt@xe_module_load@load.html
    - bat-ptl-1:          [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-1/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-1/igt@xe_module_load@load.html
    - bat-lnl-2:          [PASS][13] -> [DMESG-FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-ptl-1:          [SKIP][15] ([Intel XE#5765]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-ptl-1:          [SKIP][17] ([Intel XE#5766]) -> [SKIP][18] +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-lnl-2:          [SKIP][19] ([Intel XE#2235] / [Intel XE#2482]) -> [SKIP][20] +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-ptl-1:          [SKIP][21] ([Intel XE#5769]) -> [SKIP][22] +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-ptl-1:          [SKIP][23] ([Intel XE#5781]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-2:          [SKIP][25] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-small:
    - bat-lnl-2:          [SKIP][27] ([Intel XE#688]) -> [SKIP][28] +11 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_evict@evict-beng-small.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-ptl-1:          [SKIP][29] ([Intel XE#5764]) -> [SKIP][30] +11 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-lnl-2:          [SKIP][31] ([Intel XE#2229]) -> [FAIL][32] +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-2:          [SKIP][33] ([Intel XE#1416]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_mmap@vram.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-2:          [SKIP][35] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][37] ([Intel XE#5777]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-2:          [SKIP][39] ([Intel XE#977]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][41] ([Intel XE#5771]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][43] ([Intel XE#5780]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][45] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-lnl-2:          [SKIP][47] ([Intel XE#3342]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
Known issues
------------

  Here are the changes found in xe-pw-161033v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-lnl-2:          [PASS][49] -> [SKIP][50] ([Intel XE#2235]) +30 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@xe_intel_bb@purge-bb:
    - bat-ptl-1:          [PASS][51] -> [SKIP][52] ([Intel XE#6557]) +24 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_intel_bb@purge-bb.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_intel_bb@purge-bb.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-ptl-1:          [PASS][53] -> [FAIL][54] ([Intel XE#6710]) +4 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-lnl-2:          [SKIP][55] ([Intel XE#1466] / [Intel XE#2235]) -> [SKIP][56] ([Intel XE#2235])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-lnl-2:          [SKIP][57] ([Intel XE#2235]) -> [SKIP][58] ([Intel XE#2235] / [Intel XE#2351])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_dsc@dsc-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-lnl-2:          [SKIP][59] ([Intel XE#2235] / [Intel XE#352]) -> [SKIP][60] ([Intel XE#2235]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][61] ([Intel XE#2235] / [Intel XE#2548]) -> [SKIP][62] ([Intel XE#2235] / [Intel XE#2351])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-2:          [SKIP][63] ([Intel XE#1470] / [Intel XE#2235] / [Intel XE#2853]) -> [SKIP][64] ([Intel XE#2235])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][65] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][66] ([Intel XE#1406] / [Intel XE#2351]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-ptl-1:          [SKIP][67] ([Intel XE#1406] / [Intel XE#5778]) -> [SKIP][68] ([Intel XE#1406]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo:
    - bat-ptl-1:          [SKIP][69] ([Intel XE#5775]) -> [FAIL][70] ([Intel XE#6710]) +2 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_live_ktest@xe_bo.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - bat-ptl-1:          [SKIP][71] ([Intel XE#5776]) -> [SKIP][72] ([Intel XE#6557])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_mmap@vram.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_mmap@vram.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
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
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4 -> xe-pw-161033v1

  IGT_8729: 8729
  xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4: 6e53f6296065672f8a0c7f98b4b6c409dac382b4
  xe-pw-161033v1: 161033v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/index.html

--===============7249510428671421597==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.58.1 for LNL, PTL</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161033/">https://patchwork.freedesktop.org/series/161033/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4_BAT -&gt; xe-pw-161033v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161033v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161033v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161033v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +189 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_exec_balancer@no-exec-virtual-basic.html">SKIP</a> +176 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_live_ktest@xe_migrate.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_module_load@load.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766">Intel XE#5766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_flip@basic-flip-vs-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769">Intel XE#5769</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781">Intel XE#5781</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_evict@evict-beng-small.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_mmap@vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161033v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@purge-bb:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_intel_bb@purge-bb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_intel_bb@purge-bb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710">Intel XE#6710</a>) +4 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778">Intel XE#5778</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775">Intel XE#5775</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6710">Intel XE#6710</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776">Intel XE#5776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161033v1/bat-ptl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4 -&gt; xe-pw-161033v1</li>
</ul>
<p>IGT_8729: 8729<br />
  xe-4488-6e53f6296065672f8a0c7f98b4b6c409dac382b4: 6e53f6296065672f8a0c7f98b4b6c409dac382b4<br />
  xe-pw-161033v1: 161033v1</p>

</body>
</html>

--===============7249510428671421597==--
