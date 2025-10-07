Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D0ACCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 14:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2074310E1A2;
	Tue,  7 Oct 2025 14:23:48 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BBE10E187;
 Tue,  7 Oct 2025 14:23:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5460928819527095621=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_VF_migration_redesign_=28r?=
 =?utf-8?q?ev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Oct 2025 14:23:46 -0000
Message-ID: <175984702613.14047.14304036926027949712@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251007112641.2669655-1-matthew.brost@intel.com>
In-Reply-To: <20251007112641.2669655-1-matthew.brost@intel.com>
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

--===============5460928819527095621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF migration redesign (rev7)
URL   : https://patchwork.freedesktop.org/series/154627/
State : failure

== Summary ==

CI Bug Log - changes from xe-3880-3f87455437f945f45e2e402f59258475fcb9f249_FULL -> xe-pw-154627v7_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154627v7_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154627v7_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154627v7_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2.html

  * igt@xe_exec_compute_mode@non-blocking:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_exec_compute_mode@non-blocking.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-1/igt@xe_exec_compute_mode@non-blocking.html
    - shard-dg2-set2:     [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_exec_compute_mode@non-blocking.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@xe_exec_compute_mode@non-blocking.html
    - shard-lnl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-1/igt@xe_exec_compute_mode@non-blocking.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-lnl-7/igt@xe_exec_compute_mode@non-blocking.html
    - shard-adlp:         [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_exec_compute_mode@non-blocking.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_exec_compute_mode@non-blocking.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][10] -> [ABORT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [PASS][12] -> [ABORT][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-lnl:          [PASS][14] -> [ABORT][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-lnl-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random:
    - shard-adlp:         [PASS][16] -> [ABORT][17] +20 other tests abort
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html

  
#### Warnings ####

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-adlp:         [DMESG-FAIL][18] ([Intel XE#5213]) -> [ABORT][19] +1 other test abort
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_sriov_scheduling@equal-throughput.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0}:
    - shard-adlp:         [PASS][20] -> [ABORT][21] +12 other tests abort
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  
Known issues
------------

  Here are the changes found in xe-pw-154627v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2327])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#607])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +90 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#4345])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][29] -> [INCOMPLETE][30] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2887]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#6168])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][34] -> [DMESG-WARN][35] ([Intel XE#1727] / [Intel XE#3113])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4416]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2325])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2252]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#1178]) +3 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][40] ([Intel XE#1178]) +2 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2320])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2286])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][45] -> [FAIL][46] ([Intel XE#301]) +1 other test fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2316]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][49] -> [DMESG-WARN][50] ([Intel XE#4543]) +2 other tests dmesg-warn
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#5208])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +6 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#5390])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#651]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2313]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1503])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_hdr@static-swap.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2763]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#1439] / [Intel XE#836])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1406] / [Intel XE#1489])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_psr@pr-dpms.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#3414] / [Intel XE#3904])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4837])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#1392]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2322]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#288])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#4943]) +5 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4915]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#3573])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2284])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][74] ([Intel XE#3908]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][76] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [SKIP][78] ([Intel XE#2291]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][80] ([Intel XE#4294]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][82] ([Intel XE#2316]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][84] ([Intel XE#4543]) -> [PASS][85] +6 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][86] ([Intel XE#301]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][88] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][90] ([Intel XE#4543]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][92] ([Intel XE#1874]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][94] ([Intel XE#455]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [SKIP][96] ([Intel XE#1503]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@kms_pm_rpm@legacy-planes.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][100] ([Intel XE#1392]) -> [PASS][101] +6 other tests pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [DMESG-WARN][102] ([Intel XE#3876]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-bmg:          [DMESG-WARN][104] ([Intel XE#3876]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [SKIP][130], [PASS][131]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-4/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-4/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-9/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-9/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-9/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][157] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [INCOMPLETE][158] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][159] ([Intel XE#6168]) -> [INCOMPLETE][160] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][161] ([Intel XE#2341]) -> [FAIL][162] ([Intel XE#1178]) +1 other test fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_content_protection@srm.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_content_protection@srm.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][163] ([Intel XE#4543]) -> [DMESG-WARN][164] ([Intel XE#2953] / [Intel XE#4173])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][166] ([Intel XE#4543])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][167] ([Intel XE#1874]) -> [DMESG-FAIL][168] ([Intel XE#4543])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#2312]) +3 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][171] ([Intel XE#5390]) -> [SKIP][172] ([Intel XE#2312])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#5390]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][175] ([Intel XE#2312]) -> [SKIP][176] ([Intel XE#2311]) +9 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][177] ([Intel XE#2313]) -> [SKIP][178] ([Intel XE#2312]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][179] ([Intel XE#2312]) -> [SKIP][180] ([Intel XE#2313]) +7 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][181] ([Intel XE#3544]) -> [SKIP][182] ([Intel XE#3374] / [Intel XE#3544])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][183] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][184] ([Intel XE#5466] / [Intel XE#5530])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][185] ([Intel XE#1173]) -> [SKIP][186] ([Intel XE#1061])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-435/igt@xe_peer2peer@read.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6267
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-3880-3f87455437f945f45e2e402f59258475fcb9f249 -> xe-pw-154627v7

  IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3880-3f87455437f945f45e2e402f59258475fcb9f249: 3f87455437f945f45e2e402f59258475fcb9f249
  xe-pw-154627v7: 154627v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/index.html

--===============5460928819527095621==
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
<tr><td><b>Series:</b></td><td>VF migration redesign (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154627/">https://patchwork.freedesktop.org/series/154627/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154627v7/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154627v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3880-3f87455437f945f45e2e402f59258475f=
cb9f249_FULL -&gt; xe-pw-154627v7_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154627v7_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154627v7_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1546=
27v7_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-a-dp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@non-blocking:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_exec_=
compute_mode@non-blocking.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-1/igt@xe_exec_compute_mod=
e@non-blocking.html">INCOMPLETE</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_exe=
c_compute_mode@non-blocking.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@xe_exec_compute=
_mode@non-blocking.html">INCOMPLETE</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-1/igt@xe_exec_=
compute_mode@non-blocking.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-lnl-7/igt@xe_exec_compute_mod=
e@non-blocking.html">FAIL</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_exec=
_compute_mode@non-blocking.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_exec_compute_m=
ode@non-blocking.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bm=
g-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">=
ABORT</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-=
dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.ht=
ml">ABORT</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-1/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-ln=
l-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">=
ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf=
-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_srio=
v_auto_provisioning@selfconfig-reprovision-increase-numvfs@vf-random.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54627v7/shard-adlp-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-=
increase-numvfs@vf-random.html">ABORT</a> +20 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_sriov_scheduling@equal-throughput:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_srio=
v_scheduling@equal-throughput.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-=
6/igt@xe_sriov_scheduling@equal-throughput.html">ABORT</a> +1 other test ab=
ort</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_vide=
o_enhance0}:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_pmu@=
engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154627v7/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_=
engine_class_video_enhance0.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154627v7_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168=
">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_chamelium_color@ctm-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-st=
ress-resolution-4k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/sha=
rd-adlp-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-s=
ize.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-436/igt=
@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_flip@2x-wf_vblank-=
ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@kms_fli=
p@dpms-off-confusion-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/i=
gt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154627v7/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_psr@pr-dpms.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_eudebug_online@interrupt-r=
econnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-malloc-bo-unmap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-many-stride-malloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@xe_oa@non-privileged-access=
-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/=
shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154627v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/i=
gt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/i=
gt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@kms_fli=
p@flip-vs-dpms-on-nop@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adl=
p-1/igt@kms_flip@flip-vs-dpms-on-nop@b-hdmi-a1.html">PASS</a> +6 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shar=
d-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Int=
el XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-vs-suspend-inte=
rruptible@d-hdmi-a1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154627v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_hdr@=
invalid-metadata-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adl=
p-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-=
dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-1/igt@xe_exec=
_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/i=
gt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-4/igt@xe_exec_=
reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-2/igt@x=
e_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/sha=
rd-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f24=
9/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fc=
b9f249/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258=
475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f=
59258475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2=
e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945=
f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f8745543=
7f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87=
455437f945f45e2e402f59258475fcb9f249/shard-adlp-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880=
-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-8/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fcb9f24=
9/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258475fc=
b9f249/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f59258=
475fcb9f249/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2e402f=
59258475fcb9f249/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945f45e2=
e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3880-3f87455437f945=
f45e2e402f59258475fcb9f249/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v=
7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-154627v7/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4627v7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard=
-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-3/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154627v7/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/=
shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-6/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-154627v7/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-154627v7/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-a=
dlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-4/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154627v7/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-434/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel X=
E#6168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154627v7/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-a-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-4/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-adlp-2/igt@kms_fl=
ip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-154627v7/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-adlp-9/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-plflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54627v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154627v7/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1546=
27v7/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-bmg-3/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-154627v7/shard-bmg-3/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3880-3f87455437f945f45e2e402f59258475fcb9f249/shard-dg2-435/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154627v7/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3880-3f87455437f945f45e2e402f59258475fcb9f249 -&gt; xe-pw-154=
627v7</li>
</ul>
<p>IGT_8575: 7efc313da1339df43a1b11bba57fef6c1257e65f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3880-3f87455437f945f45e2e402f59258475fcb9f249: 3f87455437f945f45e2e402=
f59258475fcb9f249<br />
  xe-pw-154627v7: 154627v7</p>

</body>
</html>

--===============5460928819527095621==--
