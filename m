Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E06C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 14:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C12010E7E0;
	Wed,  2 Apr 2025 14:37:38 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B2010E7E0;
 Wed,  2 Apr 2025 14:37:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6578935358399976194=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/format-helper=3A_fix_b?=
 =?utf-8?q?uild?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Apr 2025 14:37:37 -0000
Message-ID: <174360465719.28364.7470787154226360543@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250402104430.142398-2-matthew.auld@intel.com>
In-Reply-To: <20250402104430.142398-2-matthew.auld@intel.com>
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

--===============6578935358399976194==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/format-helper: fix build
URL   : https://patchwork.freedesktop.org/series/147118/
State : failure

== Summary ==

CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_FULL -> xe-pw-147118v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147118v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147118v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147118v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_dirtyfb@default-dirtyfb-ioctl@a-edp-1:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_dirtyfb@default-dirtyfb-ioctl@a-edp-1.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html

  * igt@xe_pmu@all-fn-engine-activity-load (NEW):
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-load (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][8] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][9] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  
New tests
---------

  New tests have been introduced between xe-2896-f0fd77956987f035c79d08c812343a27a655a57b_FULL and xe-pw-147118v1_FULL:

### New IGT tests (18) ###

  * igt@xe_pmu@all-fn-engine-activity-load:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 10.55] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_copy0:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_decode1:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:
    - Statuses : 1 pass(s)
    - Exec time: [2.11] s

  * igt@xe_pmu@fn-engine-activity-load:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 30.19] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_copy0:
    - Statuses : 1 pass(s)
    - Exec time: [6.03] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_render0:
    - Statuses : 1 pass(s)
    - Exec time: [6.03] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_decode0:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_decode1:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:
    - Statuses : 1 pass(s)
    - Exec time: [6.04] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - Statuses : 1 pass(s) 3 skip(s)
    - Exec time: [0.0, 31.36] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_copy0:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_render0:
    - Statuses : 1 pass(s)
    - Exec time: [6.25] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode0:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_decode1:
    - Statuses : 1 pass(s)
    - Exec time: [6.28] s

  * igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance0:
    - Statuses : 1 pass(s)
    - Exec time: [6.27] s

  

Known issues
------------

  Here are the changes found in xe-pw-147118v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4543]) +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][12] -> [FAIL][13] ([Intel XE#3908]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1407])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2327])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][17] -> [DMESG-FAIL][18] ([Intel XE#4543]) +6 other tests dmesg-fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1124]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#316]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][21] ([Intel XE#4543]) +1 other test dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1124]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#2191])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#367])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +7 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#2907])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#787]) +41 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +161 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][32] -> [INCOMPLETE][33] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][34] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +27 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][40] -> [DMESG-WARN][41] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#4418])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4417]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#306])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2252]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#373]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#373]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#4346])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_color@deep-color.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_color@deep-color.html

  * igt@kms_color@deep-color@pipe-a-dp-2-ctm:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][52] ([Intel XE#4346])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_color@deep-color@pipe-a-dp-2-ctm.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2390])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][54] ([Intel XE#1178])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-1/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][55] ([Intel XE#1178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][56] ([Intel XE#1188])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][57] ([Intel XE#1188])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#309]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#309])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +2 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#4302])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#455])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2244]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#455]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#4422])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1138])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1135])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-5/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#310]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][76] -> [FAIL][77] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][78] -> [FAIL][79] ([Intel XE#301]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3321]) +1 other test fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2316])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1421]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#886])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_flip@flip-vs-wf_vblank-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_flip@flip-vs-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#2293]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#352])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#651]) +12 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#651]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#651]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#656])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#4141]) +5 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#656]) +29 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2311]) +11 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +9 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#653]) +7 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2313]) +11 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#653]) +4 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1503])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][102] -> [SKIP][103] ([Intel XE#3012])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-8/igt@kms_joiner@basic-force-big-joiner.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#2934])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2927])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][106] ([Intel XE#616]) +2 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#4596])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#455]) +17 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2763]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#2763]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#870])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][113] ([Intel XE#2938])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#870])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#870]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2391])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#908])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1439] / [Intel XE#836])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#836])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1489]) +6 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#1489]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2893]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1406]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rmfb@close-fd:
    - shard-adlp:         [PASS][128] -> [DMESG-WARN][129] ([Intel XE#4173])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@kms_rmfb@close-fd.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_rmfb@close-fd.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#3414])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1127])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#3414])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1435])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#1499])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#756]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#756])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#455] / [Intel XE#488])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#3576])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-bmg:          [PASS][139] -> [FAIL][140] ([Intel XE#4278]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@xe_compute_preempt@compute-preempt-many.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1126])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#2905]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#2905]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@discovery-race-sigint:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2905] / [Intel XE#4259])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@xe_eudebug@discovery-race-sigint.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#4577])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#4577])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#2905]) +2 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_evict@evict-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#688])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [PASS][150] -> [SKIP][151] ([Intel XE#1392]) +8 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1392]) +4 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#2322]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#1392]) +6 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#288]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#288]) +18 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#2360])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2229])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#4045])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#378])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@force-load.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#379])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#2541] / [Intel XE#3573])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][167] ([Intel XE#977])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][168] ([Intel XE#1173])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#2284] / [Intel XE#366])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#2284] / [Intel XE#366])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#1948])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#1948])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][173] -> [ABORT][174] ([Intel XE#1794])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][175] -> [ABORT][176] ([Intel XE#1794])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_pm@s4-vm-bind-userptr.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#944])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#944]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#944])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#4130])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#3342])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * {igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on}:
    - shard-lnl:          [ABORT][183] ([Intel XE#4624]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2191]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][187] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#309]) -> [PASS][190] +4 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][191] ([Intel XE#2291]) -> [PASS][192] +7 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][193] ([Intel XE#3009]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_dp_aux_dev.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#4354]) -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_dp_link_training@non-uhbr-sst.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#310]) -> [PASS][198] +7 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][199] ([Intel XE#2316]) -> [PASS][200] +5 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][201] ([Intel XE#3321]) -> [PASS][202] +2 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][203] ([Intel XE#886]) -> [PASS][204] +3 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][205] ([Intel XE#301]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][207] ([Intel XE#301]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][209] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][213] ([Intel XE#4543]) -> [PASS][214] +3 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#656]) -> [PASS][216] +9 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][217] ([Intel XE#616]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_plane_cursor@viewport.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4596]) -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-x.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-adlp:         [DMESG-WARN][221] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][222] +2 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][223] ([Intel XE#718]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#836]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#455]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_setmode@clone-exclusive-crtc.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][229] ([Intel XE#1435]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][231] ([Intel XE#771]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm:
    - shard-adlp:         [DMESG-WARN][233] ([Intel XE#4173]) -> [PASS][234] +6 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset-rpm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1392]) -> [PASS][236] +3 other tests pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([SKIP][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262]) ([Intel XE#378]) -> ([PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-435/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-435/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-435/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][288] ([Intel XE#1794]) -> [PASS][289]
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][290] ([Intel XE#1794]) -> [PASS][291]
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#787]) -> [SKIP][293] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][295] ([Intel XE#787]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          [INCOMPLETE][296] ([Intel XE#4132]) -> [FAIL][297] ([Intel XE#1178]) +1 other test fail
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-1/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][298] ([Intel XE#2341]) -> [FAIL][299] ([Intel XE#1178])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_content_protection@lic-type-0.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-1/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#455]) -> [FAIL][301] ([Intel XE#1178])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_content_protection@srm.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][302] ([Intel XE#2341]) -> [FAIL][303] ([Intel XE#1188])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_content_protection@uevent.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][304] ([i915#3804]) -> [SKIP][305] ([Intel XE#455] / [i915#3804])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][306] ([Intel XE#3321]) -> [SKIP][307] ([Intel XE#2316])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][308] ([Intel XE#2312]) -> [SKIP][309] ([Intel XE#2311]) +9 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#651]) -> [SKIP][311] ([Intel XE#656]) +3 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][312] ([Intel XE#2311]) -> [SKIP][313] ([Intel XE#2312]) +11 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][314] ([Intel XE#2312]) -> [SKIP][315] ([Intel XE#4141]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][316] ([Intel XE#4141]) -> [SKIP][317] ([Intel XE#2312]) +5 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#656]) -> [SKIP][319] ([Intel XE#651]) +18 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#656]) -> [SKIP][321] ([Intel XE#653]) +21 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#653]) -> [SKIP][323] ([Intel XE#656])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][324] ([Intel XE#2312]) -> [SKIP][325] ([Intel XE#2313]) +14 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][326] ([Intel XE#2313]) -> [SKIP][327] ([Intel XE#2312]) +10 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4596]) -> [SKIP][329] ([Intel XE#455])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#362]) -> [FAIL][331] ([Intel XE#1729])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1500]) -> [SKIP][333] ([Intel XE#362])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [SKIP][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355]) ([Intel XE#378]) -> ([PASS][356], [DMESG-WARN][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375]) ([Intel XE#4173])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-9/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1061]) -> [FAIL][377] ([Intel XE#1173])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_peer2peer@read.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_peer2peer@read.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
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
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4259
  [Intel XE#4278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4278
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4346
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4577
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8297 -> IGT_8299
  * Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -> xe-pw-147118v1

  IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8299: 8299
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c812343a27a655a57b
  xe-pw-147118v1: 147118v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/index.html

--===============6578935358399976194==
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
<tr><td><b>Series:</b></td><td>drm/format-helper: fix build</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/147118/">https://patchwork.freedesktop.org/series/147118/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-147118v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-147118v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2896-f0fd77956987f035c79d08c812343a27a=
655a57b_FULL -&gt; xe-pw-147118v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147118v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-147118v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1471=
18v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_dirtyfb@default-dirtyfb-ioctl@a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_dirt=
yfb@default-dirtyfb-ioctl@a-edp-1.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_dirtyfb=
@default-dirtyfb-ioctl@a-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_dp=
_linktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_dp_link=
train_fallback@dp-fallback.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_fli=
p@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@=
kms_flip@flip-vs-wf_vblank-interruptible@c-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_pmu@all-fn-engine-activi=
ty-load.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@xe_pmu@fn-engine-activity-loa=
d.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2896-f0fd77956987f035c79d08c81=
2343a27a655a57b_FULL and xe-pw-147118v1_FULL:</p>
<h3>New IGT tests (18)</h3>
<ul>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 10.55] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_copy0:=
</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render=
0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
decode0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
decode1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_=
enhance0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 30.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_copy0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_render0:</=
p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_deco=
de0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_deco=
de1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load@engine-drm_xe_engine_class_video_enha=
nce0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>Statuses : 1 pass(s) 3 skip(s)</li>
<li>Exec time: [0.0, 31.36] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_c=
opy0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_r=
ender0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.25] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_v=
ideo_decode0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_v=
ideo_decode1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.28] s</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_v=
ideo_enhance0:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [6.27] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147118v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_async=
_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +2 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adl=
p-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_big_fb@linear-64bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-a=
dlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 =
other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-16bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-1-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_bw@connected-linear-tili=
ng-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-=
tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-=
tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
-tiled-ccs@pipe-d-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +161 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests sk=
ip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4522">Intel XE#4522</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg=
2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_cdclk@mode-transition@p=
ipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_chamelium_frames@dp-crc-s=
ingle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-=
storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-wi=
th-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_colo=
r@deep-color.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_color@deep-color.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
346">Intel XE#4346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-ctm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_color@deep-color@pipe-a-d=
p-2-ctm.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4346">Intel XE#4346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-1/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-=
128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-=
64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@k=
ms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_display_modes@extended-mo=
de-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_dither@fb-8b=
pc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_dsc@dsc-with-bpc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirt=
y-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_feature_discovery@psr2.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip@2x-fl=
ip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-dpms-off=
-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sha=
rd-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard=
-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@kms_fli=
p@flip-vs-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_flip@f=
lip-vs-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel =
XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@kms_force_connector_basic@for=
ce-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-d=
g2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4141">Intel XE#4141</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +29 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +11 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-8/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_plane_multiple@2x-=
tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_plane_scaling@intel-max-=
src-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-modifiers.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_pm_backlight@fade-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2391">Intel XE#2391</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_dc@deep-pkgc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908=
">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-=
move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_psr@fbc-psr2-cursor-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_psr@fbc-psr2-dpms.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@kms_rmf=
b@close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@kms_rmfb@close-fd.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_rotation_crc@primary-4-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-2/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@kms_writeback@writeback-inva=
lid-parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/756">Intel XE#756</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_ccs@block-multicopy-inpla=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@xe_compu=
te_preempt@compute-preempt-many.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-5/igt@xe_compute_pr=
eempt@compute-preempt-many.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4278">Intel XE#4278</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@xe_eudebug@basic-exec-queues.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_eudebug@basic-read-event.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-sigint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-8/igt@xe_eudebug@discovery-race-sig=
int.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2905">Intel XE#2905</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4259">Intel XE#4259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_eudebug_online@set-breakp=
oint-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-4/igt@xe_eudebug_online@set-breakpo=
int-sigint-debugger.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4577">Intel XE#4577</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_evict@evict-large-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe=
_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +=
8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exe=
c-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_live_ktest@xe_bo.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229=
">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_live_ktest@xe_bo@xe_ccs_m=
igrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@force-load.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@xe_oa@buffer-fill.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541"=
>Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_oa@create-destroy-userspa=
ce-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cf=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_pm@d3cold-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_pm@d3hot-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/19=
48">Intel XE#1948</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-3/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-7/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@intel_sy=
sfs_debugfs@xe-debugfs-read-all-entries-display-on.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624">Intel XE#4624=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1471=
18v1/shard-lnl-4/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-displa=
y-on.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147118v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-43=
3/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html">PASS</a> +4 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-147118v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-8/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_dp=
_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@k=
ms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-=
463/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> +7 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/s=
hard-bmg-5/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">=
PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147118v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@b=
d-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip=
@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-5/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +3 other tests =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_fl=
ip@flip-vs-expired-vblank@a-hdmi-a6.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466=
/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_fl=
ip@flip-vs-suspend@a-hdmi-a6.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v=
1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147118v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16=
bpp-xtile-downscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47118v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-render.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_pl=
ane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-464/igt@kms_plane_c=
ursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@kms_=
plane_multiple@2x-tiling-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@kms_pla=
ne_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"=
>Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-147118v1/shard-adlp-4/igt@kms_plane_scaling@planes-=
upscale-factor-0-25-downscale-factor-0-75.html">PASS</a> +2 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-3/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_pm=
_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_pm_rp=
m@modeset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@kms_=
setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bm=
g-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-6/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl=
-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/igt@kms_vbl=
ank@ts-continuation-modeset-rpm.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adl=
p-1/igt@kms_vblank@ts-continuation-modeset-rpm.html">PASS</a> +6 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1392">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-bindexecqueue-userptr-invalidate.html">PASS</a> +3 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_mo=
dule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-4=
35/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a6=
55a57b/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c81234=
3a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d0=
8c812343a27a655a57b/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f03=
5c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956=
987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0f=
d77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-28=
96-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655=
a57b/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a=
27a655a57b/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c8=
12343a27a655a57b/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c7=
9d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987=
f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77=
956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-=
f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-46=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
7118v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sh=
ard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-435/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-147118v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47118v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-=
432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-432/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147118v1/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/=
shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-9/igt@xe_pm@s=
4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_pm@s4-basic-e=
xec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-prefetch.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-lnl-1/igt@xe_pm@s4-vm-=
bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
118v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms@pipe-a-dp-2.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sh=
ard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Inte=
l XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_cont=
ent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-1/igt@kms_c=
ontent_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms_conten=
t_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shar=
d-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sh=
ard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v=
1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47118v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1471=
18v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Inte=
l XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147118v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1471=
18v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-147118v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147=
118v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#=
2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
147118v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-463/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-466/igt@=
kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-ad=
lp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57=
b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a6=
55a57b/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343=
a27a655a57b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c8=
12343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79=
d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f0=
35c79d08c812343a27a655a57b/shard-adlp-1/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956=
987f035c79d08c812343a27a655a57b/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd=
77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2896=
-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-2/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-adlp-1/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a655a57=
b/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2896-f0fd77956987f035c79d08c812343a27a6=
55a57b/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@=
load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147118v1/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47118v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shar=
d-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-147118v1/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118=
v1/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adl=
p-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
47118v1/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2896-f0fd77956987f035c79d08c812343a27a655a57b/shard-dg2-432/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-147118v1/shard-dg2-433/igt@xe_peer2peer@read=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8297 -&gt; IGT_8299</li>
<li>Linux: xe-2896-f0fd77956987f035c79d08c812343a27a655a57b -&gt; xe-pw-147=
118v1</li>
</ul>
<p>IGT_8297: 0a27244ed1972af84c78d68523d5791e596349e7 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8299: 8299<br />
  xe-2896-f0fd77956987f035c79d08c812343a27a655a57b: f0fd77956987f035c79d08c=
812343a27a655a57b<br />
  xe-pw-147118v1: 147118v1</p>

</body>
</html>

--===============6578935358399976194==--
