Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101B9FD5316
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 09:11:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC06D10EA6B;
	Fri, 27 Feb 2026 09:11:17 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0944310EA6B;
 Fri, 27 Feb 2026 09:11:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8733938967982666151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc=3A_Add_support_?=
 =?utf-8?q?for_NPK_as_a_GuC_log_target_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 09:11:16 -0000
Message-ID: <177218347601.294209.8780154619481665104@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226232648.675128-1-stuart.summers@intel.com>
In-Reply-To: <20260226232648.675128-1-stuart.summers@intel.com>
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

--===============8733938967982666151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add support for NPK as a GuC log target (rev2)
URL   : https://patchwork.freedesktop.org/series/162087/
State : failure

== Summary ==

CI Bug Log - changes from xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed_FULL -> xe-pw-162087v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162087v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162087v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162087v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small-multi-vm-cm:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@xe_evict@evict-beng-small-multi-vm-cm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe_evict@evict-beng-small-multi-vm-cm.html

  * igt@xe_exec_system_allocator@many-stride-mmap-nomemset:
    - shard-bmg:          [PASS][3] -> [TIMEOUT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@xe_exec_system_allocator@many-stride-mmap-nomemset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-nomemset.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][5] ([Intel XE#6703]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  
Known issues
------------

  Here are the changes found in xe-pw-162087v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-after-suspend.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#3304])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#1178] / [Intel XE#3304])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#301]) +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4141])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7283])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#5021])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2234] / [Intel XE#2850])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#6361]) +3 other tests fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-6/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_setmode@basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1499])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_vrr@flip-suspend.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#6874]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#5625])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2248] / [Intel XE#7325])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#944])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          [PASS][29] -> [FAIL][30] ([Intel XE#5937]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [FAIL][31] -> [PASS][32] +2 other tests pass
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_atomic_transition@modeset-transition.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][33] -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][35] ([Intel XE#2029] / [Intel XE#7314]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@i2c:
    - shard-bmg:          [SKIP][37] ([Intel XE#6693]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_pm_rpm@i2c.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_pm_rpm@i2c.html

  * igt@xe_exec_system_allocator@many-malloc-race-nomemset:
    - shard-bmg:          [DMESG-FAIL][39] ([Intel XE#5213] / [Intel XE#5545] / [Intel XE#6652]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_system_allocator@many-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - shard-bmg:          [SKIP][41] ([Intel XE#6703]) -> [PASS][42] +125 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [SKIP][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68]) ([Intel XE#378]) -> ([PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-3/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-6/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-6/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-7/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-7/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-3/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-7/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-7/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-7/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-6/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-6/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-4/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-4/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-8/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-8/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-1/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-1/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-1/igt@xe_module_load@load.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-bmg:          [SKIP][93] ([Intel XE#7258]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe_pm_residency@aspm_link_residency.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#1124]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#367])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2887]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#2325])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#2252]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][105] ([Intel XE#6703]) -> [SKIP][106] ([Intel XE#2341])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_content_protection@lic-type-1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_content_protection@lic-type-1.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#1508])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [SKIP][110] ([Intel XE#4422])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#7178])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2311]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#7061])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#4141]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#2313]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#7283]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#1489]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_psr@psr2-suspend.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][127] ([Intel XE#1729]) -> [SKIP][128] ([Intel XE#2426])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@discovery-empty:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#4837])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_eudebug@discovery-empty.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_eudebug@discovery-empty.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#6665] / [Intel XE#6681])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_eudebug_online@pagefault-write-stress.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:
    - shard-bmg:          [SKIP][133] ([Intel XE#6703]) -> [SKIP][134] ([Intel XE#7136]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:
    - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#6874]) +5 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][137] ([Intel XE#6703]) -> [SKIP][138] ([Intel XE#7138]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2284])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_pm@d3cold-basic-exec.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#944])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7258]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7258
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7314
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed -> xe-pw-162087v2

  IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed: e42f7566b0d3eba44a6aeeae2c810025c66c44ed
  xe-pw-162087v2: 162087v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/index.html

--===============8733938967982666151==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add support for NPK as a GuC log=
 target (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162087/">https://patchwork.freedesktop.org/series/162087/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162087v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162087v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4627-e42f7566b0d3eba44a6aeeae2c810025c=
66c44ed_FULL -&gt; xe-pw-162087v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162087v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-162087v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1620=
87v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@xe_evict=
@evict-beng-small-multi-vm-cm.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe_evict@evict-=
beng-small-multi-vm-cm.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-3/igt@xe_exec_=
system_allocator@many-stride-mmap-nomemset.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe=
_exec_system_allocator@many-stride-mmap-nomemset.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@flip-vs-cursor-atomic:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162087v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-6/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_psr@fbc-psr-primary-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-6/igt@kms_setm=
ode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-162087v2/shard-bmg-4/igt@kms_setmode@basic.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel X=
E#6361</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-5/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-4/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard=
-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7325">Intel XE#7325</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-4/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-9/igt@xe_sriov=
_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/sha=
rd-bmg-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-num=
vfs.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5937">Intel XE#5937</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_atom=
ic_transition@modeset-transition.html">FAIL</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_atomic_t=
ransition@modeset-transition.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@kms_fbco=
n_fbt@psr-suspend.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7314">Intel XE#7314</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@kms_p=
m_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_pm_r=
pm@i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6693">Intel XE#6693</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_pm_rpm@i2c.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-malloc-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_=
system_allocator@many-malloc-race-nomemset.html">DMESG-FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">In=
tel XE#5545</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/6652">Intel XE#6652</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_exec_system_allocator@many=
-malloc-race-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemse=
t:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-many-execqueues-malloc-race-nomemset.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Int=
el XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-162087v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqu=
eues-malloc-race-nomemset.html">PASS</a> +125 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed=
/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c=
44ed/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025=
c66c44ed/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c81=
0025c66c44ed/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae=
2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6a=
eeae2c810025c66c44ed/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba4=
4a6aeeae2c810025c66c44ed/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3=
eba44a6aeeae2c810025c66c44ed/shard-lnl-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566=
b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load@load.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-e42f=
7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-7/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4627-=
e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/sh=
ard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44e=
d/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
087v2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162087v2/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
087v2/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162087v2/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
087v2/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162087v2/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
087v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162087v2/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
087v2/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-5/igt@xe_pm_re=
sidency@aspm_link_residency.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7258">Intel XE#7258</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-2/igt@xe_=
pm_residency@aspm_link_residency.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_bw@l=
inear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/=
igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shar=
d-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">In=
tel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_cham=
elium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@km=
s_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_cham=
elium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-=
6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_cont=
ent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_c=
ontent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_dirt=
yfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2=
/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162087v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yft=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard=
-bmg-6/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Inte=
l XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/sh=
ard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-=
6/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-b=
mg-6/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE=
#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_plan=
e@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shar=
d-bmg-6/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">In=
tel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_psr2=
_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/s=
hard-bmg-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@kms_psr@=
psr2-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@kms_psr@psr2-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-4/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-8/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_eudeb=
ug@discovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_eudebug@d=
iscovery-empty.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_eudeb=
ug_online@pagefault-write-stress.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/ig=
t@xe_eudebug_online@pagefault-write-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE=
#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_=
fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bm=
g-6/igt@xe_exec_fault_mode@once-multi-queue-rebind-imm.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7=
136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#67=
03</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
2087v2/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-dyn=
-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel=
 XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-162087v2/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-=
vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_pm@d3=
cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_pm@d3cold-ba=
sic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed/shard-bmg-2/igt@xe_query=
@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162087v2/shard-bmg-6/igt@xe_q=
uery@multigpu-query-pxp-status.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed -&gt; xe-pw-162=
087v2</li>
</ul>
<p>IGT_8774: 8892452285d691f612ecb3b2a6fefc50983af15f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4627-e42f7566b0d3eba44a6aeeae2c810025c66c44ed: e42f7566b0d3eba44a6aeea=
e2c810025c66c44ed<br />
  xe-pw-162087v2: 162087v2</p>

</body>
</html>

--===============8733938967982666151==--
