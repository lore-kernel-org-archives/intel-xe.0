Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36DDC3ABBE
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 02:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E7510E744;
	Wed,  7 May 2025 02:55:16 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C7410E744;
 Wed,  7 May 2025 02:55:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6870172525683310314=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Enable_SVM_atomics_in_Xe_/?=
 =?utf-8?q?_GPU_SVM_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 May 2025 02:55:15 -0000
Message-ID: <174658651565.53681.15511048265075609200@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250506230132.1188732-1-matthew.brost@intel.com>
In-Reply-To: <20250506230132.1188732-1-matthew.brost@intel.com>
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

--===============6870172525683310314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable SVM atomics in Xe / GPU SVM (rev6)
URL   : https://patchwork.freedesktop.org/series/147846/
State : failure

== Summary ==

CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL -> xe-pw-147846v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147846v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147846v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147846v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@plain-flip-ts-check@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@b-dp2.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [PASS][2] -> [ABORT][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][4] -> [INCOMPLETE][5] +1 other test incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          [SKIP][6] ([Intel XE#2291]) -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  
New tests
---------

  New tests have been introduced between xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL and xe-pw-147846v6_FULL:

### New IGT tests (1) ###

  * igt@kms_dsc@dsc-with-output-formats:
    - Statuses : 4 skip(s)
    - Exec time: [0.0, 0.00] s

  

Known issues
------------

  Here are the changes found in xe-pw-147846v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#911]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#316])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][12] ([Intel XE#4543])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#2191])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#2191])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#787]) +8 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#2907])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#3442])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#787]) +125 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][23] -> [INCOMPLETE][24] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][25] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#306])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#373]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#373]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#307])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][31] ([Intel XE#1178]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#309]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#4494])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#3009])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_aux_dev.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#4356])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#776])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#310]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#3321]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2316]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#301]) +6 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][49] ([Intel XE#2953] / [Intel XE#4173])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][50] ([Intel XE#2882])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2-set2:     [PASS][51] -> [FAIL][52] ([Intel XE#886])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@plain-flip-ts-check.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#886]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][55] -> [FAIL][56] ([Intel XE#2882]) +1 other test fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][57] -> [FAIL][58] ([Intel XE#2882]) +5 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#455]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [PASS][60] -> [DMESG-FAIL][61] ([Intel XE#4543]) +1 other test dmesg-fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][62] -> [FAIL][63] ([Intel XE#1874])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][64] ([Intel XE#4173])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#651]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#656]) +10 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#651]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#653]) +8 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#653]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#2927])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][71] -> [DMESG-WARN][72] ([Intel XE#4173]) +8 other tests dmesg-warn
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#870])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#1129])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1489]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#1489]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr@psr-cursor-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_psr@psr-cursor-plane-onoff.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#3414]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#1435])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#3428]) +20 other tests dmesg-warn
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1123])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1126])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#4837]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#4837]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#261] / [Intel XE#688])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#688])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1392]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][92] -> [SKIP][93] ([Intel XE#1392]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1392]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#288]) +5 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#288]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#2360])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#4915]) +38 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#4929])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4915]) +33 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-bmg:          [PASS][102] -> [FAIL][103] ([Intel XE#4929])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#2229])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4501])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_oa@buffer-size.html

  * igt@xe_oa@disabled-read-error:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#2541] / [Intel XE#3573])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2541] / [Intel XE#3573])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-wait:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#979])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#1173])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2284] / [Intel XE#366])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][114] -> [ABORT][115] ([Intel XE#1794])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@xe_pm@s4-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][116] -> [ABORT][117] ([Intel XE#1794])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#4733])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#4733])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#4814])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html

  
#### Possible fixes ####

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
    - shard-adlp:         [SKIP][121] ([Intel XE#4618]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][123] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][125] ([Intel XE#3862]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][127] ([Intel XE#2291]) -> [PASS][128] +2 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [DMESG-WARN][129] ([Intel XE#4173]) -> [PASS][130] +5 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][131] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][133] ([Intel XE#301]) -> [PASS][134] +2 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][135] ([Intel XE#2316]) -> [PASS][136] +13 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][137] ([Intel XE#3321]) -> [PASS][138] +4 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][139] ([Intel XE#1503]) -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_hdr@static-swap.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][141] ([Intel XE#4596]) -> [PASS][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:
    - shard-bmg:          [DMESG-WARN][143] ([Intel XE#3428]) -> [PASS][144]
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][145] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_rpm@legacy-planes.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_pm_rpm@legacy-planes.html

  * igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:
    - shard-adlp:         [SKIP][147] ([Intel XE#4945]) -> [PASS][148] +5 other tests pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html

  * igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][149] -> [PASS][150] +23 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1392]) -> [PASS][152] +10 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-dg2-set2:     [INCOMPLETE][153] ([Intel XE#4423]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][155] -> [SKIP][156] ([Intel XE#316])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-adlp:         [SKIP][157] -> [SKIP][158] ([Intel XE#1124])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][159] ([Intel XE#4950]) -> [SKIP][160] ([Intel XE#2191])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         [SKIP][161] -> [SKIP][162] ([Intel XE#2907]) +2 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-adlp:         [SKIP][163] -> [SKIP][164] ([Intel XE#306])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_color@ctm-limited-range.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-adlp:         [SKIP][165] ([Intel XE#4950]) -> [SKIP][166] ([Intel XE#373])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-adlp:         [SKIP][167] -> [SKIP][168] ([Intel XE#373])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         [SKIP][169] -> [SKIP][170] ([Intel XE#307])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][171] ([Intel XE#2341]) -> [FAIL][172] ([Intel XE#1178])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_content_protection@legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][173] ([Intel XE#1188]) -> [SKIP][174] ([Intel XE#2341])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_content_protection@uevent.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][175] ([Intel XE#4354]) -> [DMESG-FAIL][176] ([Intel XE#3428])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][177] ([Intel XE#3321]) -> [SKIP][178] ([Intel XE#2316])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [SKIP][179] -> [DMESG-WARN][180] ([Intel XE#2953] / [Intel XE#4173])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-adlp:         [SKIP][181] -> [SKIP][182] ([Intel XE#455])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [DMESG-FAIL][183] ([Intel XE#4543]) -> [FAIL][184] ([Intel XE#1874])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2311]) +12 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][187] ([Intel XE#2311]) -> [SKIP][188] ([Intel XE#2312]) +12 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][189] ([Intel XE#2312]) -> [SKIP][190] ([Intel XE#4141]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][191] ([Intel XE#4141]) -> [SKIP][192] ([Intel XE#2312]) +10 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][193] -> [SKIP][194] ([Intel XE#651])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][195] ([Intel XE#2351]) -> [SKIP][196] ([Intel XE#656])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][197] ([Intel XE#2313]) -> [SKIP][198] ([Intel XE#2312]) +11 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][199] ([Intel XE#2312]) -> [SKIP][200] ([Intel XE#2313]) +16 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][201] -> [SKIP][202] ([Intel XE#656]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
    - shard-adlp:         [SKIP][203] -> [SKIP][204] ([Intel XE#653]) +2 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         [SKIP][205] -> [SKIP][206] ([Intel XE#870])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][207] ([Intel XE#718]) -> [DMESG-WARN][208] ([Intel XE#4173])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         [SKIP][209] ([Intel XE#2351]) -> [SKIP][210] ([Intel XE#1129])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         [SKIP][211] -> [SKIP][212] ([Intel XE#1489]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         [SKIP][213] -> [SKIP][214] ([Intel XE#2850] / [Intel XE#929])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         [SKIP][215] ([Intel XE#4947]) -> [SKIP][216] ([Intel XE#2850] / [Intel XE#929])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         [SKIP][217] -> [SKIP][218] ([Intel XE#1126])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-adlp:         [SKIP][219] ([Intel XE#4945]) -> [SKIP][220] ([Intel XE#4837])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eudebug_online@tdctl-parameters.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         [SKIP][221] -> [SKIP][222] ([Intel XE#688])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-adlp:         [SKIP][223] -> [SKIP][224] ([Intel XE#1392])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-adlp:         [SKIP][225] ([Intel XE#4945]) -> [SKIP][226] ([Intel XE#1392])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         [SKIP][227] -> [SKIP][228] ([Intel XE#288]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:
    - shard-adlp:         [SKIP][229] -> [SKIP][230] ([Intel XE#4915]) +17 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         [SKIP][231] -> [SKIP][232] ([Intel XE#4501])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@buffer-size.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_oa@buffer-size.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         [SKIP][233] ([Intel XE#4945]) -> [SKIP][234] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1061]) -> [FAIL][236] ([Intel XE#1173])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_peer2peer@read.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][237] -> [SKIP][238] ([Intel XE#1948])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         [SKIP][239] -> [SKIP][240] ([Intel XE#4814])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_render_copy@render-stress-1-copies.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_render_copy@render-stress-1-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4423
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -> xe-pw-147846v6

  IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d72b9df35ed6aed9ae9
  xe-pw-147846v6: 147846v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/index.html

--===============6870172525683310314==
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
<tr><td><b>Series:</b></td><td>Enable SVM atomics in Xe / GPU SVM (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147846/">https://patchwork.freedesktop.org/series/147846/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL -&gt; xe-pw-147846v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147846v6_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147846v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147846v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@b-dp2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@xe_pmu@engine-activity-idle@engine-drm_xe_engine_class_render0.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9_FULL and xe-pw-147846v6_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dsc@dsc-with-output-formats:<ul>
<li>Statuses : 4 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147846v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@plain-flip-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_flip@plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_psr@psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +20 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_evict@evict-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-435/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-free-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929">Intel XE#4929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-busy-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929">Intel XE#4929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_oa@syncs-syncobj-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-lnl-6/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@xe_pxp@display-black-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_hdr@static-swap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-1/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-4/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_drm_fdinfo@parallel-utilization-single-full-load-isolation.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-434/igt@xe_pm@s2idle-d3hot-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4423">Intel XE#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-466/igt@xe_pm@s2idle-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-busy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@buffer-size.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_oa@buffer-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-dg2-432/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9/shard-adlp-8/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147846v6/shard-adlp-2/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9 -&gt; xe-pw-147846v6</li>
</ul>
<p>IGT_8354: 59f7153426484367f58edfafb6567ce4e6a9e499 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3043-842c3c276c106040f9b96d72b9df35ed6aed9ae9: 842c3c276c106040f9b96d72b9df35ed6aed9ae9<br />
  xe-pw-147846v6: 147846v6</p>

</body>
</html>

--===============6870172525683310314==--
