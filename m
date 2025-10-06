Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D5CAC5B8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 15:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8B4410E426;
	Mon,  6 Oct 2025 15:53:53 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95FD810E36D;
 Mon,  6 Oct 2025 15:53:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7597888461038298648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Intel_Xe_GPU_Debug_Support?=
 =?utf-8?q?_=28eudebug=29_v5?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kuoppala" <mika.kuoppala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Oct 2025 15:53:52 -0000
Message-ID: <175976603260.8781.1720130571722292767@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20251006111711.201906-1-mika.kuoppala@linux.intel.com>
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

--===============7597888461038298648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel Xe GPU Debug Support (eudebug) v5
URL   : https://patchwork.freedesktop.org/series/155452/
State : failure

== Summary ==

CI Bug Log - changes from xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d_FULL -> xe-pw-155452v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155452v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155452v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155452v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_eudebug_online@basic-breakpoint@drm_xe_engine_class_render0:
    - shard-lnl:          NOTRUN -> [FAIL][3] +25 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_eudebug_online@basic-breakpoint@drm_xe_engine_class_render0.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode@drm_xe_engine_class_render0:
    - shard-bmg:          NOTRUN -> [FAIL][4] +31 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@xe_eudebug_online@breakpoint-not-in-debug-mode@drm_xe_engine_class_render0.html

  * igt@xe_eudebug_online@debugger-reopen@drm_xe_engine_class_render0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][5] +32 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen@drm_xe_engine_class_render0.html

  * igt@xe_eudebug_online@preempt-breakpoint@drm_xe_engine_class_render0:
    - shard-adlp:         NOTRUN -> [FAIL][6] +18 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@xe_eudebug_online@preempt-breakpoint@drm_xe_engine_class_render0.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_oa@syncs-ufence-wait-cfg@ccs-0:
    - shard-bmg:          NOTRUN -> [ABORT][8] +2 other tests abort
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@xe_oa@syncs-ufence-wait-cfg@ccs-0.html

  * igt@xe_oa@syncs-ufence-wait@ccs-0:
    - shard-bmg:          [PASS][9] -> [ABORT][10] +4 other tests abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-2/igt@xe_oa@syncs-ufence-wait@ccs-0.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_oa@syncs-ufence-wait@ccs-0.html

  * igt@xe_oa@syncs-ufence-wait@rcs-0:
    - shard-lnl:          NOTRUN -> [ABORT][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-4/igt@xe_oa@syncs-ufence-wait@rcs-0.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-lnl:          [PASS][12] -> [ABORT][13] +6 other tests abort
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-7/igt@xe_oa@syncs-userptr-wait-cfg.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-3/igt@xe_oa@syncs-userptr-wait-cfg.html

  
#### Warnings ####

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#4837]) -> [FAIL][15] +53 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug@basic-close.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          [SKIP][16] ([Intel XE#4837]) -> [FAIL][17] +57 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-3/igt@xe_eudebug@basic-connect.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-4/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-access-faultable:
    - shard-adlp:         [SKIP][18] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][19] +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug@basic-vm-access-faultable.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug@basic-vm-access-faultable.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][20] ([Intel XE#4837]) -> [FAIL][21] +52 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     [SKIP][22] ([Intel XE#4837]) -> [SKIP][23] +6 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-433/igt@xe_eudebug@vm-bind-clear-faultable.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         [SKIP][24] ([Intel XE#4837] / [Intel XE#5565]) -> [FAIL][25] +48 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_eudebug_online@set-breakpoint-faultable@drm_xe_engine_class_compute0}:
    - shard-lnl:          NOTRUN -> [FAIL][26] +2 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint-faultable@drm_xe_engine_class_compute0.html

  * {igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0}:
    - shard-bmg:          NOTRUN -> [FAIL][27] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0.html

  * {igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_render0}:
    - shard-adlp:         NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_render0.html

  * {igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add}:
    - shard-dg2-set2:     [SKIP][30] ([Intel XE#6281]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * {igt@xe_noexec_ping_pong@basic}:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@xe_noexec_ping_pong@basic.html

  * {igt@xe_pmu@engine-activity-accuracy-50}:
    - shard-adlp:         [PASS][33] -> [FAIL][34] +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-50.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_pmu@engine-activity-accuracy-50.html

  
New tests
---------

  New tests have been introduced between xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d_FULL and xe-pw-155452v1_FULL:

### New IGT tests (1) ###

  * igt@xe_eudebug_online@interrupt-other@drm_xe_engine_class_compute0:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  

Known issues
------------

  Here are the changes found in xe-pw-155452v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2233])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#623])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2327])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1124]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#1124]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2328])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2314] / [Intel XE#2894])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#2191])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#367])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#367]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#787]) +125 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#455] / [Intel XE#787]) +22 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +8 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#2907])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#3432])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][52] ([Intel XE#6168])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][53] ([Intel XE#1727] / [Intel XE#3113])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2325])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2252]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#373]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][57] ([Intel XE#1178])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1178]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#307])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][60] ([Intel XE#3304])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2341])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1188])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2320])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#308])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2291])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][67] ([Intel XE#3226]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4494])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +15 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2244])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#4422])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2316]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@dpms-off-confusion@c-hdmi-a1:
    - shard-adlp:         [PASS][74] -> [DMESG-WARN][75] ([Intel XE#4543]) +8 other tests dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html

  * igt@kms_flip@nonexisting-fb:
    - shard-adlp:         [PASS][76] -> [DMESG-WARN][77] ([Intel XE#2953] / [Intel XE#4173])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-4/igt@kms_flip@nonexisting-fb.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@kms_flip@nonexisting-fb.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2293]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#651]) +7 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2311]) +8 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#5390]) +5 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#653]) +20 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2313]) +15 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#1503])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2927])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#2927])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#3012])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-bmg:          [PASS][90] -> [SKIP][91] ([Intel XE#3012])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2501])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#356])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#616])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#5021])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#5021])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2505])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1406] / [Intel XE#1489]) +5 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#1406] / [Intel XE#2414])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1406] / [Intel XE#2939])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][106] ([Intel XE#6171])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#3414])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2504])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram@drm_xe_engine_class_render0:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#455]) +6 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram@drm_xe_engine_class_render0.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram@drm_xe_engine_class_compute0:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#2825]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram@drm_xe_engine_class_compute0.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#2322]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [PASS][112] -> [SKIP][113] ([Intel XE#1392]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#1392])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#288]) +11 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][116] -> [DMESG-WARN][117] ([Intel XE#3876])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@evict-malloc:
    - shard-bmg:          [PASS][118] -> [ABORT][119] ([Intel XE#3970])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-4/igt@xe_exec_system_allocator@evict-malloc.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-2/igt@xe_exec_system_allocator@evict-malloc.html

  * igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#4943]) +12 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][121] ([Intel XE#2594])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-new-busy.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#4915]) +95 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_exec_system_allocator@twice-malloc-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#4915]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_exec_system_allocator@twice-malloc-race-nomemset.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#3573]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#6032])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#5742])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [PASS][127] -> [DMESG-WARN][128] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2284] / [Intel XE#366])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4650])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#944])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4814])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:
    - shard-adlp:         [PASS][133] -> [DMESG-FAIL][134] ([Intel XE#5213] / [Intel XE#5545]) +1 other test dmesg-fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][135] ([Intel XE#3862]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][137] ([Intel XE#3862]) -> [PASS][138] +1 other test pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][139] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345] / [Intel XE#6168]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][141] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#6168]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-bmg:          [SKIP][143] ([Intel XE#2291]) -> [PASS][144] +1 other test pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][145] ([Intel XE#2373]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][147] ([Intel XE#2316]) -> [PASS][148] +4 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#4543]) -> [PASS][150] +5 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][151] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [INCOMPLETE][153] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][154] +3 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][155] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][156] +9 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][157] ([Intel XE#4543]) -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][159] ([Intel XE#2571]) -> [PASS][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         [SKIP][161] ([Intel XE#4519]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-bmg:          [SKIP][163] ([Intel XE#5793]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1392]) -> [PASS][166] +5 other tests pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          [SKIP][167] ([Intel XE#4837]) -> [PASS][168] +2 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
    - shard-adlp:         [SKIP][169] ([Intel XE#4837] / [Intel XE#5565]) -> [PASS][170] +6 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-2/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_sip_eudebug@wait-writesip-nodebug:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#4837]) -> [PASS][172] +2 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
    - shard-lnl:          [SKIP][173] ([Intel XE#4837]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-8/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-1/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
    - shard-lnl:          [FAIL][175] ([Intel XE#6267]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][177] ([Intel XE#2833]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html
    - shard-adlp:         [SKIP][179] ([Intel XE#455] / [Intel XE#5712]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@xe_live_ktest@xe_eudebug.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#455]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-432/igt@xe_live_ktest@xe_eudebug.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@xe_live_ktest@xe_eudebug.html
    - shard-lnl:          [SKIP][183] ([Intel XE#2833]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@xe_pm@s2idle-basic.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][187] ([Intel XE#4819]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-434/igt@xe_pmu@gt-frequency.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][189] ([Intel XE#2341]) -> [FAIL][190] ([Intel XE#1178])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [TIMEOUT][191] ([Intel XE#4543]) -> [DMESG-WARN][192] ([Intel XE#4543]) +1 other test dmesg-warn
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][193] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][194] ([Intel XE#4543]) +1 other test dmesg-warn
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][195] ([Intel XE#2312]) -> [SKIP][196] ([Intel XE#2311]) +7 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][197] ([Intel XE#2312]) -> [SKIP][198] ([Intel XE#5390]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][199] ([Intel XE#5390]) -> [SKIP][200] ([Intel XE#2312]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][201] ([Intel XE#2311]) -> [SKIP][202] ([Intel XE#2312]) +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][203] ([Intel XE#2313]) -> [SKIP][204] ([Intel XE#2312]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][205] ([Intel XE#2312]) -> [SKIP][206] ([Intel XE#2313]) +7 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][207] ([Intel XE#734]) -> [FAIL][208] ([Intel XE#3325])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][209] ([Intel XE#1729]) -> [SKIP][210] ([Intel XE#2426])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][211] ([Intel XE#2426]) -> [SKIP][212] ([Intel XE#2509])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@multigpu-basic-client:
    - shard-bmg:          [SKIP][213] ([Intel XE#4837]) -> [SKIP][214] ([Intel XE#3894]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_eudebug@multigpu-basic-client.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-lnl:          [SKIP][215] ([Intel XE#4837]) -> [SKIP][216] ([Intel XE#5132]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-8/igt@xe_eudebug@multigpu-basic-client-many.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         [SKIP][217] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][218] ([Intel XE#5565]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_eudebug@read-metadata.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         [SKIP][219] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][220] ([Intel XE#2846])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4837]) -> [SKIP][222] ([Intel XE#2846])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#4837]) -> [SKIP][224] ([Intel XE#455]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-lnl:          [SKIP][225] ([Intel XE#4837]) -> [SKIP][226] ([Intel XE#2825]) +5 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-adlp:         [SKIP][227] ([Intel XE#4837] / [Intel XE#5565]) -> [SKIP][228] ([Intel XE#455]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][229] ([Intel XE#5530]) -> [ABORT][230] ([Intel XE#4917] / [Intel XE#5530])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-adlp:         [SKIP][231] ([Intel XE#944]) -> [FAIL][232] ([Intel XE#6249])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3894
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5132
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168
  [Intel XE#6171]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6171
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#6249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6249
  [Intel XE#6267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6267
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d -> xe-pw-155452v1

  IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d: dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d
  xe-pw-155452v1: 155452v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/index.html

--===============7597888461038298648==
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
<tr><td><b>Series:</b></td><td>Intel Xe GPU Debug Support (eudebug) v5</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155452/">https://patchwork.freedesktop.org/series/155452/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d_FULL -&gt; xe-pw-155452v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155452v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-155452v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-155452v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_eudebug_online@basic-breakpoint@drm_xe_engine_class_render0.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@xe_eudebug_online@breakpoint-not-in-debug-mode@drm_xe_engine_class_render0.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen@drm_xe_engine_class_render0.html">FAIL</a> +32 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@xe_eudebug_online@preempt-breakpoint@drm_xe_engine_class_render0.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@xe_oa@syncs-ufence-wait-cfg@ccs-0.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait@ccs-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-2/igt@xe_oa@syncs-ufence-wait@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_oa@syncs-ufence-wait@ccs-0.html">ABORT</a> +4 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-4/igt@xe_oa@syncs-ufence-wait@rcs-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-7/igt@xe_oa@syncs-userptr-wait-cfg.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-3/igt@xe_oa@syncs-userptr-wait-cfg.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_eudebug@basic-close.html">FAIL</a> +53 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-3/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-4/igt@xe_eudebug@basic-connect.html">FAIL</a> +57 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-faultable:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug@basic-vm-access-faultable.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">FAIL</a> +52 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-433/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-3/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">FAIL</a> +48 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_eudebug_online@set-breakpoint-faultable@drm_xe_engine_class_compute0}:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-7/igt@xe_eudebug_online@set-breakpoint-faultable@drm_xe_engine_class_compute0.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0.html">FAIL</a> +2 other tests fail</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_compute0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_render0}:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger@drm_xe_engine_class_render0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add}:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_noexec_ping_pong@basic}:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@xe_noexec_ping_pong@basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@engine-activity-accuracy-50}:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_pmu@engine-activity-accuracy-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_pmu@engine-activity-accuracy-50.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d_FULL and xe-pw-155452v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_eudebug_online@interrupt-other@drm_xe_engine_class_compute0:<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155452v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_cursor_legacy@torture-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@kms_flip@dpms-off-confusion@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@nonexisting-fb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-4/igt@kms_flip@nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@kms_flip@nonexisting-fb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_rotation_crc@multiplane-rotation.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6171">Intel XE#6171</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-vram@drm_xe_engine_class_render0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram@drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-7/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram@drm_xe_engine_class_compute0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825">Intel XE#2825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-9/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@evict-malloc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-4/igt@xe_exec_system_allocator@evict-malloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-2/igt@xe_exec_system_allocator@evict-malloc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-new-busy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-execqueues-new-busy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +95 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-malloc-race-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-4/igt@xe_exec_system_allocator@twice-malloc-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032">Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets@numvfs-random.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168">Intel XE#6168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-436/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@xe_eudebug_sriov@deny-sriov.html">PASS</a> +1 other test pass</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-5/igt@xe_eudebug_sriov@deny-sriov.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">PASS</a> +2 other tests pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-2/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@wait-writesip-nodebug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-466/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-432/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">PASS</a> +2 other tests pass</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-8/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-1/igt@xe_exec_sip_eudebug@wait-writesip-nodebug.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6267">Intel XE#6267</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-3/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-1/igt@xe_live_ktest@xe_eudebug.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5712">Intel XE#5712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@xe_live_ktest@xe_eudebug.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-432/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-464/igt@xe_live_ktest@xe_eudebug.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-1/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-5/igt@xe_live_ktest@xe_eudebug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-9/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-2/igt@xe_pm@s2idle-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-434/igt@xe_pmu@gt-frequency.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819">Intel XE#4819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-bmg-5/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3894">Intel XE#3894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-8/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-1/igt@xe_eudebug@multigpu-basic-client-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5132">Intel XE#5132</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846">Intel XE#2846</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-435/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2846">Intel XE#2846</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-dg2-463/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-lnl-2/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2825">Intel XE#2825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-1/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565">Intel XE#5565</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d/shard-adlp-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155452v1/shard-adlp-3/igt@xe_query@multigpu-query-uc-fw-version-huc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6249">Intel XE#6249</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d -&gt; xe-pw-155452v1</li>
</ul>
<p>IGT_8574: 44a15713124663a622c6eddf7c6ee5ba732e0d41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3870-dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d: dba1fd9754c6ee58b05564ffa50bbe7be5ddf37d<br />
  xe-pw-155452v1: 155452v1</p>

</body>
</html>

--===============7597888461038298648==--
