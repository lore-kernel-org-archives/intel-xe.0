Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF98CAC5B8
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 02:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060E510E653;
	Wed,  1 Oct 2025 02:30:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772A310E659;
 Wed,  1 Oct 2025 02:30:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2876972869180913484=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Allow_configfs_to_disable_?=
 =?utf-8?q?specific_GT_type=28s=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Oct 2025 02:30:43 -0000
Message-ID: <175928584347.381167.8258839043174993328@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
In-Reply-To: <20250930225618.140071-25-matthew.d.roper@intel.com>
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

--===============2876972869180913484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow configfs to disable specific GT type(s) (rev3)
URL   : https://patchwork.freedesktop.org/series/154739/
State : failure

== Summary ==

CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL -> xe-pw-154739v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154739v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154739v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154739v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_pmu@engine-activity-most-load-idle:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +22 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_pmu@engine-activity-most-load-idle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-2/igt@xe_pmu@engine-activity-most-load-idle.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][3] ([Intel XE#1727] / [Intel XE#3113]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [DMESG-WARN][5] ([Intel XE#3876]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1}:
    - shard-bmg:          [PASS][7] -> [ABORT][8] +14 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-4/igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1.html

  
New tests
---------

  New tests have been introduced between xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947_FULL and xe-pw-154739v3_FULL:

### New IGT tests (55) ###

  * igt@kms_joiner@basic-big-joiner:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_joiner@basic-force-big-joiner:
    - Statuses : 3 pass(s) 1 skip(s)
    - Exec time: [0.0, 2.29] s

  * igt@kms_joiner@basic-force-big-joiner@single:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 2.29] s

  * igt@kms_joiner@basic-force-ultra-joiner:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_joiner@basic-ultra-joiner:
    - Statuses : 3 skip(s)
    - Exec time: [0.0] s

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - Statuses :
    - Exec time: [None] s

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - Statuses : 2 pass(s) 1 skip(s)
    - Exec time: [0.0, 0.41] s

  * igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe:
    - Statuses : 2 pass(s)
    - Exec time: [0.34, 0.41] s

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - Statuses : 4 skip(s)
    - Exec time: [0.0] s

  * igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.25] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.26] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.27] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.46] s

  * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [3.55] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.84] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.45] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.59] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.55] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.46] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.86] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.08] s

  * igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.85] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.67] s

  * igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.85] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.64] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.77] s

  * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.66] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.42] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.47] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.73] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.39] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [1.48] s

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-hdmi-a-1:
    - Statuses : 1 pass(s)
    - Exec time: [0.37] s

  * igt@kms_pm_backlight@brightness-with-dpms:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.40] s

  * igt@kms_pm_backlight@brightness-with-dpms@edp-1:
    - Statuses : 1 pass(s)
    - Exec time: [2.37] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout:
    - Statuses : 3 pass(s)
    - Exec time: [2.69, 3.46] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@bcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 0.69] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@ccs:
    - Statuses : 2 pass(s)
    - Exec time: [0.70] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@rcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 0.69] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 0.69] s

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vecs:
    - Statuses : 3 pass(s)
    - Exec time: [0.67, 0.69] s

  

Known issues
------------

  Here are the changes found in xe-pw-154739v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +118 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#2907])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#1727] / [Intel XE#3113]) +1 other test dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#306])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] ([Intel XE#1178])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2291]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#455]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][20] -> [FAIL][21] ([Intel XE#3098])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][22] ([Intel XE#3098])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2316]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#301])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][27] -> [FAIL][28] ([Intel XE#301] / [Intel XE#3149])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#4543]) +6 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][31] -> [DMESG-FAIL][32] ([Intel XE#4543])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1874])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#651]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#653]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][37] ([Intel XE#616]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#2953] / [Intel XE#4173]) +4 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_backlight@brightness-with-dpms (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#2938])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#1435])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#4488]) +1 other test incomplete
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load:
    - shard-adlp:         [PASS][46] -> [TIMEOUT][47] ([Intel XE#3876])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@xe_drm_fdinfo@parallel-utilization-single-full-load.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#1392]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#288]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2360])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#3876])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_exec_reset@parallel-gt-reset.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4915]) +30 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-busy-nomemset.html

  * igt@xe_exec_threads@threads-rebind:
    - shard-adlp:         [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#3876]) +1 other test dmesg-fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_exec_threads@threads-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@xe_exec_threads@threads-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][57] -> [DMESG-WARN][58] ([Intel XE#5893])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#3573])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][60] -> [DMESG-WARN][61] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#4733])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#4814])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_render_copy@render-stress-4-copies.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][64] ([Intel XE#3908]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][68] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][70] ([Intel XE#2291]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][72] ([Intel XE#2316]) -> [PASS][73] +3 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_flip@2x-plain-flip.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-4/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][74] ([Intel XE#301]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][76] ([Intel XE#4543]) -> [PASS][77] +5 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-6/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][78] ([Intel XE#4543]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][80] ([Intel XE#1874]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][82] ([Intel XE#1503]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#1392]) -> [PASS][85] +3 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [DMESG-WARN][86] -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:
    - shard-lnl:          [FAIL][88] -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * {igt@xe_exec_system_allocator@prefetch-sys-benchmark}:
    - shard-bmg:          [CRASH][90] ([Intel XE#6192]) -> [PASS][91] +4 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-1/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html

  * {igt@xe_exec_system_allocator@twice-malloc-prefetch}:
    - shard-lnl:          [CRASH][92] ([Intel XE#6192]) -> [PASS][93] +8 other tests pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_system_allocator@twice-malloc-prefetch.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-7/igt@xe_exec_system_allocator@twice-malloc-prefetch.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][94] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][95] +2 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@xe_pm@s3-vm-bind-prefetch.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-3/igt@xe_pm@s3-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][96] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][97] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][98] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522] / [Intel XE#6014]) -> [INCOMPLETE][99] ([Intel XE#6014])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          [FAIL][100] ([Intel XE#301]) -> [FAIL][101] ([Intel XE#301] / [Intel XE#3149])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:
    - shard-adlp:         [TIMEOUT][102] ([Intel XE#4543]) -> [DMESG-WARN][103] ([Intel XE#4543]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][104] ([Intel XE#5208]) -> [DMESG-WARN][105] ([Intel XE#4543] / [Intel XE#5208]) +1 other test dmesg-warn
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-3/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][106] ([Intel XE#2953] / [Intel XE#4173]) -> [DMESG-WARN][107] ([Intel XE#4543])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][108] ([Intel XE#2312]) -> [SKIP][109] ([Intel XE#2311]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][110] ([Intel XE#2311]) -> [SKIP][111] ([Intel XE#2312]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][112] ([Intel XE#5390]) -> [SKIP][113] ([Intel XE#2312]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][114] ([Intel XE#2312]) -> [SKIP][115] ([Intel XE#2313]) +7 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][116] ([Intel XE#2313]) -> [SKIP][117] ([Intel XE#2312]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][118] ([Intel XE#3544]) -> [SKIP][119] ([Intel XE#3374] / [Intel XE#3544])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][120] ([Intel XE#5021]) -> [SKIP][121] ([Intel XE#4596])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-y.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][122] ([Intel XE#3325]) -> [SKIP][123] ([Intel XE#734])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][124] ([Intel XE#1173]) -> [SKIP][125] ([Intel XE#1061])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@xe_peer2peer@write.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -> xe-pw-154739v3

  IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec249df8a3cc053eb947
  xe-pw-154739v3: 154739v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/index.html

--===============2876972869180913484==
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
<tr><td><b>Series:</b></td><td>Allow configfs to disable specific GT type(s=
) (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154739/">https://patchwork.freedesktop.org/series/154739/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154739v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154739v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3850-23f8be57505c80e5b57dec249df8a3cc0=
53eb947_FULL -&gt; xe-pw-154739v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154739v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154739v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1547=
39v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_pmu@engine-activity-most-load-idle:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_pmu@e=
ngine-activity-most-load-idle.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-2/igt@xe_pmu@engine-a=
ctivity-most-load-idle.html">ABORT</a> +22 other tests abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154739v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled=
-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg=
-3/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_engine_class_vid=
eo_enhance1}:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_pmu@e=
ngine-activity-multi-client@engine-drm_xe_engine_class_video_enhance1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154739v3/shard-bmg-4/igt@xe_pmu@engine-activity-multi-client@engine-drm_xe_=
engine_class_video_enhance1.html">ABORT</a> +14 other tests abort</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3850-23f8be57505c80e5b57dec249=
df8a3cc053eb947_FULL and xe-pw-154739v3_FULL:</p>
<h3>New IGT tests (55)</h3>
<ul>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>Statuses : 3 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner@single:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 2.29] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>Statuses : 3 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>Statuses : 2 pass(s) 1 skip(s)</li>
<li>Exec time: [0.0, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe:=
</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.34, 0.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@cursor-implicit-plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-b-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.27] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.84] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.67] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-mid@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.64] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.77] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-a-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc@pipe-d-hdmi-a-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.73] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-a-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-c-edp-1:<=
/p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.48] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant@pipe-d-hdmi-a-=
1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.40] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms@edp-1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [2.69, 3.46] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@bcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@ccs:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@rcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vecs:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.67, 0.69] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154739v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-ti=
led-mtl-rc-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +118 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard=
-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3113">Intel XE#3113</a>) +1 other test dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_dsc@dsc-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolut=
e-wf_vblank@bc-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-d=
pms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-8/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp=
-9/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp=
-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-466/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_pla=
ne_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/sha=
rd-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pip=
e-d.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-436/igt@kms_vb=
lank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-464/=
igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-dp-4.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Int=
el XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_drm_=
fdinfo@parallel-utilization-single-full-load.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/i=
gt@xe_drm_fdinfo@parallel-utilization-single-full-load.html">TIMEOUT</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel X=
E#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-lr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-busy-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-large-execqueues-new-busy-nomemset.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#=
4915</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@xe_exec=
_threads@threads-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-4/igt@xe_exec_threads@thre=
ads-rebind.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-4=
36/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
93">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_oa@invalid-oa-format-id.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-4/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-8/igt@xe_pm@s2idle-vm-bin=
d-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel XE#4504</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_pxp@pxp-stale-queue-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel=
 XE#3908</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154739v3/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-463/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/s=
hard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions.html">=
PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-4/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-2/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shar=
d-adlp-6/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> +5 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154739v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a=
-1-y-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1547=
39v3/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_hdr@=
static-toggle-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-4/igt@kms_hdr@s=
tatic-toggle-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v=
3/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-3/igt@xe_exec=
_reset@cm-close-fd.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-2/igt@xe_exec_reset@cm-cl=
ose-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma}:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shar=
d-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vm=
a.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@prefetch-sys-benchmark}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-8/igt@xe_exec_=
system_allocator@prefetch-sys-benchmark.html">CRASH</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-=
bmg-1/igt@xe_exec_system_allocator@prefetch-sys-benchmark.html">PASS</a> +4=
 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-malloc-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-4/igt@xe_exec_=
system_allocator@twice-malloc-prefetch.html">CRASH</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-l=
nl-7/igt@xe_exec_system_allocator@twice-malloc-prefetch.html">PASS</a> +8 o=
ther tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-6/igt@xe_pm@s=
3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-ad=
lp-3/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel=
 XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-=
dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014">Intel XE#601=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
739v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-=
c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6014">Intel XE#6014</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-lnl-2/igt@kms_flip@=
flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-1/igt@kms_fli=
p@flip-vs-panning-vs-hang@d-hdmi-a1.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-ad=
lp-4/igt@kms_flip@flip-vs-panning-vs-hang@d-hdmi-a1.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel X=
E#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-3=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Inte=
l XE#5208</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adl=
p-8/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/sh=
ard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54739v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154739v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur=
-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-1/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-7/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-adlp-6/igt@kms_pm_dc@dc9-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947/shard-dg2-463/igt@xe_pee=
r2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154739v3/shard-dg2-432/igt@xe_peer2peer@wri=
te.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947 -&gt; xe-pw-154=
739v3</li>
</ul>
<p>IGT_8564: fd0f7b3639b26971567b7a9d64ba5174d5d3db5a @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3850-23f8be57505c80e5b57dec249df8a3cc053eb947: 23f8be57505c80e5b57dec2=
49df8a3cc053eb947<br />
  xe-pw-154739v3: 154739v3</p>

</body>
</html>

--===============2876972869180913484==--
