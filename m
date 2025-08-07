Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5398BC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB49010E004;
	Thu,  7 Aug 2025 11:05:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624A10E004;
 Thu,  7 Aug 2025 11:05:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7386084299000484556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Optimi?=
 =?utf-8?q?ze_panel_power-on_wait_time_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 11:05:23 -0000
Message-ID: <175456472301.219015.2460599249623076993@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807082402.79018-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20250807082402.79018-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============7386084299000484556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Optimize panel power-on wait time (rev8)
URL   : https://patchwork.freedesktop.org/series/150958/
State : failure

== Summary ==

CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL -> xe-pw-150958v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150958v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150958v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150958v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html

  
#### Warnings ####

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          [SKIP][3] ([Intel XE#4518]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html

  
New tests
---------

  New tests have been introduced between xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL and xe-pw-150958v8_FULL:

### New IGT tests (11) ###

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-10:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-11:
    - Statuses : 1 pass(s)
    - Exec time: [1.74] s

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-12:
    - Statuses : 1 pass(s)
    - Exec time: [1.64] s

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-8:
    - Statuses : 1 pass(s)
    - Exec time: [1.63] s

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-9:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_compute0:
    - Statuses : 1 pass(s)
    - Exec time: [2.28] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:
    - Statuses : 1 pass(s)
    - Exec time: [2.10] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0:
    - Statuses : 1 pass(s)
    - Exec time: [6.05] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:
    - Statuses : 1 pass(s)
    - Exec time: [6.05] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_compute0:
    - Statuses : 1 pass(s)
    - Exec time: [6.28] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1:
    - Statuses : 1 dmesg-warn(s)
    - Exec time: [6.31] s

  

Known issues
------------

  Here are the changes found in xe-pw-150958v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] ([Intel XE#4208]) +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@core_getversion@all-cards.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@fbdev@nullptr.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#2134])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@fbdev@unaligned-read.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@fbdev@unaligned-read.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +62 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][12] -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [PASS][14] -> [INCOMPLETE][15] ([Intel XE#3124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [DMESG-WARN][17] ([Intel XE#1727] / [Intel XE#3113])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] ([Intel XE#1178])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2291]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#4494])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#5352]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2316]) +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][27] -> [DMESG-WARN][28] ([Intel XE#4543]) +2 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#4543]) +1 other test dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][31] -> [FAIL][32] ([Intel XE#1874]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#4208]) +144 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#455])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][38] -> [SKIP][39] ([Intel XE#1503])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_hdr@static-swap.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#4208] / [i915#2575]) +106 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#4173]) +3 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#4208] / [i915#2575]) +22 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [PASS][46] -> [SKIP][47] ([Intel XE#1392]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#4208]) +223 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#455])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#1173])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][52] -> [DMESG-WARN][53] ([Intel XE#3428]) +1 other test dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_pm_residency@cpg-basic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@xe_pm_residency@cpg-basic.html

  * {igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1} (NEW):
    - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#3876])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html

  * igt@xe_vm@large-userptr-split-binds-134217728:
    - shard-adlp:         [PASS][55] -> [DMESG-WARN][56] ([Intel XE#3868])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-134217728.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-134217728.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [DMESG-FAIL][57] ([Intel XE#4543]) -> [PASS][58] +2 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_async_flips@crc.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-2/igt@kms_async_flips@crc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][59] ([Intel XE#2291]) -> [PASS][60] +3 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][61] ([Intel XE#4302]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][63] ([Intel XE#2316]) -> [PASS][64] +4 other tests pass
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [DMESG-WARN][65] ([Intel XE#4543] / [Intel XE#5208]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][67] ([Intel XE#4543]) -> [PASS][68] +4 other tests pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][69] ([Intel XE#1503]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][71] ([Intel XE#3012]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][73] ([Intel XE#4596]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:
    - shard-adlp:         [DMESG-WARN][75] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][76] +5 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [FAIL][77] ([Intel XE#4227]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_vrr@flipline.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-lnl-1/igt@kms_vrr@flipline.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          [SKIP][79] ([Intel XE#1091] / [Intel XE#2849]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1392]) -> [PASS][82] +3 other tests pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][83] ([Intel XE#5786]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [SKIP][85] ([Intel XE#4650]) -> [PASS][86] +1 other test pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-bmg:          [SKIP][87] ([Intel XE#4130]) -> [PASS][88] +4 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [SKIP][89] ([Intel XE#3342]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-bmg:          [SKIP][91] ([Intel XE#4351]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#623]) -> [SKIP][94] ([Intel XE#4208] / [i915#2575])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#316]) -> [SKIP][96] ([Intel XE#4208]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#316]) -> [SKIP][98] ([Intel XE#2351] / [Intel XE#4208])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1124]) -> [SKIP][100] ([Intel XE#2351] / [Intel XE#4208])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1124]) -> [SKIP][102] ([Intel XE#4208]) +11 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#2191]) -> [SKIP][104] ([Intel XE#4208] / [i915#2575])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#367]) -> [SKIP][106] ([Intel XE#4208] / [i915#2575]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][108] ([Intel XE#4208]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#2907]) -> [SKIP][110] ([Intel XE#4208]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#3442]) -> [SKIP][112] ([Intel XE#4208])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][114] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][115] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [SKIP][116] ([Intel XE#2351] / [Intel XE#4208])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#306]) -> [SKIP][118] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_chamelium_color@degamma.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#373]) -> [SKIP][120] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#307]) -> [SKIP][122] ([Intel XE#4208] / [i915#2575])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][123] ([Intel XE#1178]) -> [SKIP][124] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][125] ([Intel XE#2341]) -> [FAIL][126] ([Intel XE#1178])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_content_protection@srm.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#308]) -> [SKIP][128] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#323]) -> [SKIP][130] ([Intel XE#4208] / [i915#2575])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#4354]) -> [SKIP][132] ([Intel XE#4208])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#4422]) -> [SKIP][134] ([Intel XE#4208])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#776]) -> [SKIP][136] ([Intel XE#4208])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#1135]) -> [SKIP][138] ([Intel XE#4208] / [i915#2575])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#455]) -> [SKIP][140] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#455]) -> [SKIP][142] ([Intel XE#4208]) +6 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#2312]) -> [SKIP][144] ([Intel XE#2311]) +11 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][145] ([Intel XE#2311]) -> [SKIP][146] ([Intel XE#2312]) +12 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#651]) -> [SKIP][148] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][149] ([Intel XE#2312]) -> [SKIP][150] ([Intel XE#5390]) +7 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][151] ([Intel XE#5390]) -> [SKIP][152] ([Intel XE#2312]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#651]) -> [SKIP][154] ([Intel XE#4208]) +21 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#653]) -> [SKIP][156] ([Intel XE#4208]) +25 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][157] ([Intel XE#2312]) -> [SKIP][158] ([Intel XE#2313]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#658]) -> [SKIP][160] ([Intel XE#2351] / [Intel XE#4208])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1158]) -> [SKIP][162] ([Intel XE#4208])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][163] ([Intel XE#2313]) -> [SKIP][164] ([Intel XE#2312]) +12 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#653]) -> [SKIP][166] ([Intel XE#2351] / [Intel XE#4208]) +10 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#346]) -> [SKIP][168] ([Intel XE#4208])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#4298]) -> [SKIP][170] ([Intel XE#4208])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][171] ([Intel XE#5021]) -> [SKIP][172] ([Intel XE#4596])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#5021]) -> [SKIP][174] ([Intel XE#4208] / [i915#2575])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#870]) -> [SKIP][176] ([Intel XE#4208]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1122]) -> [SKIP][178] ([Intel XE#2351] / [Intel XE#4208])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#1129]) -> [SKIP][180] ([Intel XE#4208])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][181] ([Intel XE#3325]) -> [SKIP][182] ([Intel XE#734])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1489]) -> [SKIP][184] ([Intel XE#4208]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][186] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][188] ([Intel XE#4208]) +14 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#3414]) -> [SKIP][190] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][191] ([Intel XE#1729]) -> [SKIP][192] ([Intel XE#4208] / [i915#2575])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#455]) -> [SKIP][194] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_vrr@flipline.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][196] ([Intel XE#4208])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#5249]) -> [SKIP][198] ([Intel XE#4208])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_configfs@survivability-mode.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#5626]) -> [SKIP][200] ([Intel XE#4208])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_eu_stall@non-blocking-re-enable.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#4837]) -> [SKIP][202] ([Intel XE#4208]) +16 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1392]) -> [INCOMPLETE][204] ([Intel XE#4842])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#288]) -> [SKIP][206] ([Intel XE#4208]) +31 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#2360]) -> [SKIP][208] ([Intel XE#4208])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#4915]) -> [SKIP][210] ([Intel XE#4208]) +310 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][211] ([Intel XE#5530]) -> [ABORT][212] ([Intel XE#4917] / [Intel XE#5530])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#5103]) -> [SKIP][214] ([Intel XE#4208])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#3573]) -> [SKIP][216] ([Intel XE#4208]) +7 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1061]) -> [FAIL][218] ([Intel XE#1173])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_peer2peer@write.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][220] ([Intel XE#4208])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          [SKIP][221] ([Intel XE#5695]) -> [SKIP][222] ([Intel XE#5742])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@xe_pm@d3hot-i2c.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-lnl-1/igt@xe_pm@d3hot-i2c.html
    - shard-adlp:         [SKIP][223] ([Intel XE#5695]) -> [SKIP][224] ([Intel XE#5742])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-2/igt@xe_pm@d3hot-i2c.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-8/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][225] ([Intel XE#5695]) -> [SKIP][226] ([Intel XE#5742])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_pm@d3hot-i2c.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4650]) -> [SKIP][228] ([Intel XE#4208]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@xe_pmu@all-fn-engine-activity-load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [SKIP][229] ([Intel XE#4650]) -> [DMESG-WARN][230] ([Intel XE#3876])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4733]) -> [SKIP][232] ([Intel XE#4208]) +3 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#944]) -> [SKIP][234] ([Intel XE#4208]) +1 other test skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4814]) -> [SKIP][236] ([Intel XE#4208]) +1 other test skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4130]) -> [SKIP][238] ([Intel XE#4208])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5762
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -> xe-pw-150958v8

  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8
  xe-pw-150958v8: 150958v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/index.html

--===============7386084299000484556==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Optimize panel power-on wait time (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150958/">https://patchwork.freedesktop.org/series/150958/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL -&gt; xe-pw-150958v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150958v8_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-150958v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-150958v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_compute@ccs-mode-basic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-8/igt@xe_compute@ccs-mode-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@xe_compute@ccs-mode-basic.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_eudebug_sriov@deny-sriov:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_FULL and xe-pw-150958v8_FULL:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-10:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-11:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.74] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-12:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.64] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-8:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.63] s</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-9:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1:</p>
<ul>
<li>Statuses : 1 dmesg-warn(s)</li>
<li>Exec time: [6.31] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150958v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@fbdev@unaligned-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5352">Intel XE#5352</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +144 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_hdr@static-swap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_lease@lease-invalid-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_lease@lease-invalid-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +106 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +223 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-4/igt@xe_pm_residency@cpg-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@xe_pm_residency@cpg-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-134217728:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-134217728.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-134217728.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_async_flips@crc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-2/igt@kms_async_flips@crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_flip@flip-vs-rmfb.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-2/igt@kms_flip@flip-vs-rmfb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_hdr@static-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-a.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-lnl-1/igt@kms_vrr@flipline.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-433/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@xe_pmu@fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_eudebug@vma-ufence-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842">Intel XE#4842</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +310 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_oa@mmio-triggered-reports-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-lnl-3/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-lnl-1/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-adlp-2/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-adlp-8/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-6/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5695">Intel XE#5695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-1/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-466/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pmu@all-fn-engine-activity-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-bmg-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150958v8/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -&gt; xe-pw-150958v8</li>
</ul>
<p>IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8<br />
  xe-pw-150958v8: 150958v8</p>

</body>
</html>

--===============7386084299000484556==--
