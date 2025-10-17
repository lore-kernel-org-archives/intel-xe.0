Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984BACCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 18:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D92110E09C;
	Fri, 17 Oct 2025 18:43:58 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F18810E09C;
 Fri, 17 Oct 2025 18:43:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7960302623427750264=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fix_DRM_scheduler_layering?=
 =?utf-8?q?_violations_in_Xe_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 17 Oct 2025 18:43:57 -0000
Message-ID: <176072663715.28222.9481729104860478582@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251016204826.284077-1-matthew.brost@intel.com>
In-Reply-To: <20251016204826.284077-1-matthew.brost@intel.com>
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

--===============7960302623427750264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix DRM scheduler layering violations in Xe (rev3)
URL   : https://patchwork.freedesktop.org/series/155314/
State : failure

== Summary ==

CI Bug Log - changes from xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad_FULL -> xe-pw-155314v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-155314v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-155314v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-155314v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-8/igt@kms_pm_rpm@legacy-planes-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-4/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [PASS][6] -> [SKIP][7] +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-464/igt@kms_pm_rpm@universal-planes.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html
    - shard-lnl:          [PASS][8] -> [SKIP][9] +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-3/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-2/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][12] +1 other test abort
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][13] -> [ABORT][14] +3 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@many-reload.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][15] -> [ABORT][16] +9 other tests abort
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@xe_module_load@reload.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@xe_module_load@reload.html
    - shard-lnl:          [PASS][17] -> [ABORT][18] +6 other tests abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-4/igt@xe_module_load@reload.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-5/igt@xe_module_load@reload.html
    - shard-bmg:          [PASS][19] -> [ABORT][20] +1 other test abort
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-1/igt@xe_module_load@reload.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-1/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][21] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][23] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          [SKIP][25] ([Intel XE#6010]) -> [ABORT][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-7/igt@xe_configfs@survivability-mode.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_configfs@survivability-mode.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [ABORT][27] ([Intel XE#4757]) -> [ABORT][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_configfs@engines-allowed}:
    - shard-lnl:          [PASS][29] -> [ABORT][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-7/igt@xe_configfs@engines-allowed.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/igt@xe_configfs@engines-allowed.html

  
Known issues
------------

  Here are the changes found in xe-pw-155314v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2327]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#610])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1124]) +15 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#316]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1124]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][36] ([Intel XE#4543]) +6 other tests dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1428])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#1124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#2191]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#367])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#367])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#367]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +45 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2887]) +6 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#787]) +6 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#2887]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#787]) +68 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#3862]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#2907])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][53] -> [INCOMPLETE][54] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][55] -> [INCOMPLETE][56] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#4418])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#4416]) +3 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#306])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#306]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#306])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#373])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#373]) +10 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2252]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][65] ([Intel XE#1178]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1178]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2320])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1424])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#308]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#309])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-bmg:          [PASS][72] -> [SKIP][73] ([Intel XE#2291])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#309]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#323])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#4302])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#4354])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#4354])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#4356])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#4422]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#703])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1421])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#310]) +10 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:
    - shard-adlp:         [PASS][84] -> [DMESG-WARN][85] ([Intel XE#4543]) +1 other test dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][86] ([Intel XE#4543]) +13 other tests dmesg-warn
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][89] -> [INCOMPLETE][90] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-5/igt@kms_flip@flip-vs-suspend.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][91] -> [INCOMPLETE][92] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-432/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2293] / [Intel XE#2380])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2293])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2380]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][96] ([Intel XE#4543] / [Intel XE#4921]) +5 other tests dmesg-fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#651]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#651]) +12 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#651]) +7 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2311]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#5390]) +5 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-stridechange.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1151])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +5 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#653]) +13 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#2313]) +4 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#656]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#656]) +51 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#455]) +16 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#346])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#346])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2925])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2486])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#599]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#4596])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#5020])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#870])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#3309])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         NOTRUN -> [FAIL][118] ([Intel XE#718])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#6070]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#836])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         [PASS][121] -> [SKIP][122] ([Intel XE#6070]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@kms_pm_rpm@legacy-planes-dpms.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1406] / [Intel XE#1489]) +11 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#1406] / [Intel XE#1489])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1406] / [Intel XE#1489]) +3 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#1122] / [Intel XE#1406] / [Intel XE#5580])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_psr@pr-suspend.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1406] / [Intel XE#2414])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#2330])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#3414])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#455] / [Intel XE#488] / [Intel XE#5607]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#1123])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#1123]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1126])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#944]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#4837] / [Intel XE#5565]) +18 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#4837]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#4837]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#4837]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#261]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#261] / [Intel XE#5564]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#688]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#688]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1392])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#2322]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1392] / [Intel XE#5575]) +12 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#288] / [Intel XE#5561]) +30 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#288]) +6 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#2360])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_system_allocator@once-large-mmap-free-huge:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#4943]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_exec_system_allocator@once-large-mmap-free-huge.html

  * igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#4915]) +308 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#4943])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#4915]) +50 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [PASS][157] -> [ABORT][158] ([Intel XE#5530]) +1 other test abort
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][159] -> [ABORT][160] ([Intel XE#5530]) +7 other tests abort
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-adlp:         NOTRUN -> [ABORT][161] ([Intel XE#5530])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#5100]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#512])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177]) -> ([PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [SKIP][192], [PASS][193]) ([Intel XE#378] / [Intel XE#5612])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-6/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-6/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-9/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-9/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][194] -> [ABORT][195] ([Intel XE#5087])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@xe_module_load@many-reload.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][196] -> [ABORT][197] ([Intel XE#5087])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-464/igt@xe_module_load@reload-no-display.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@xe_module_load@reload-no-display.html
    - shard-lnl:          [PASS][198] -> [ABORT][199] ([Intel XE#5087]) +1 other test abort
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-5/igt@xe_module_load@reload-no-display.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@buffer-size:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#6032])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_oa@buffer-size.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#3573])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#2248])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#3573]) +7 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][204] ([Intel XE#2284])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-adlp:         NOTRUN -> [SKIP][205] ([Intel XE#5742])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3hot-basic-exec:
    - shard-adlp:         NOTRUN -> [WARN][206] ([Intel XE#4504])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exec.html
    - shard-bmg:          [PASS][207] -> [WARN][208] ([Intel XE#4504])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-7/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html
    - shard-lnl:          [PASS][209] -> [WARN][210] ([Intel XE#4504])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][211] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#4733])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#4733] / [Intel XE#5594]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][214] ([Intel XE#944])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-adlp:         NOTRUN -> [SKIP][215] ([Intel XE#4814] / [Intel XE#5614]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_render_copy@render-stress-0-copies.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#4814])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#4130]) +1 other test skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][218] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][220] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][222] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#6014]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][224] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][226] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][228] ([Intel XE#2291]) -> [PASS][229] +3 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][230] ([Intel XE#4633]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][232] ([Intel XE#2316]) -> [PASS][233] +6 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][234] ([Intel XE#3012]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [FAIL][236] ([Intel XE#4741]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][238] ([Intel XE#1435]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][240] ([Intel XE#6321]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * {igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1}:
    - shard-bmg:          [DMESG-WARN][242] ([Intel XE#3876]) -> [PASS][243] +1 other test pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-2/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][244] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-WARN][245] ([Intel XE#4543])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][246] ([Intel XE#2312]) -> [SKIP][247] ([Intel XE#2311]) +8 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][248] ([Intel XE#2312]) -> [SKIP][249] ([Intel XE#5390]) +4 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][250] ([Intel XE#2311]) -> [SKIP][251] ([Intel XE#2312])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][252] ([Intel XE#2313]) -> [SKIP][253] ([Intel XE#2312]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][254] ([Intel XE#2312]) -> [SKIP][255] ([Intel XE#2313]) +11 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][256] ([Intel XE#4596]) -> [SKIP][257] ([Intel XE#5021])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-adlp:         [SKIP][258] ([Intel XE#836]) -> [SKIP][259] ([Intel XE#6070])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_pm_rpm@modeset-non-lpsp.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4741
  [Intel XE#4757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5565]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5580]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5580
  [Intel XE#5594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594
  [Intel XE#5607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5614]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5614
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#6014]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6014
  [Intel XE#6032]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032
  [Intel XE#6070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6070
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6313
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad -> xe-pw-155314v3

  IGT_8588: 8588
  xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad: bf6a6de7a240324a2d0bfca44a9760d9f9750bad
  xe-pw-155314v3: 155314v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/index.html

--===============7960302623427750264==
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
<tr><td><b>Series:</b></td><td>Fix DRM scheduler layering violations in Xe =
(rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155314/">https://patchwork.freedesktop.org/series/155314/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155314v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155314v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f=
9750bad_FULL -&gt; xe-pw-155314v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-155314v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-155314v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1553=
14v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-8/igt@kms_pm_r=
pm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-4/igt@kms_pm_rpm@legacy-plane=
s-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp=
.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-464/igt@kms_pm=
_rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@kms_pm_rpm@universal-=
planes.html">SKIP</a> +3 other tests skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-8/igt@kms_pm_r=
pm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/igt@kms_pm_rpm@universal-plan=
es.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-3/igt@kms_vbla=
nk@ts-continuation-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-2/igt@kms_v=
blank@ts-continuation-suspend@pipe-c-edp-1.html">DMESG-WARN</a> +2 other te=
sts dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_mmio_send_recv.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_module_load@many-relo=
ad.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@xe_module_load@reload.html"=
>ABORT</a> +9 other tests abort</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-4/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155314v3/shard-lnl-5/igt@xe_module_load@reload.html">ABO=
RT</a> +6 other tests abort</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-1/igt@xe_modul=
e_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155314v3/shard-bmg-1/igt@xe_module_load@reload.html">ABO=
RT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bm=
g-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-1/igt@kms_pm_r=
pm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-5/i=
gt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-7/igt@xe_confi=
gfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_confi=
gfs@survivability-mode.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-1/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4757">Intel XE#4757</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v=
3/shard-lnl-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.h=
tml">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_configfs@engines-allowed}:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-7/igt@xe_confi=
gfs@engines-allowed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/igt@xe_configfs@engines-allow=
ed.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155314v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_big_fb@linear-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests=
 dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-=
stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_bw@connected-linear-tili=
ng-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_bw@linear-tiling-3-disp=
lays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_bw@linear-tiling-4-displ=
ays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +45 other tests ski=
p</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_ccs@crc-primary-rotation=
-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +68 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-8/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-7/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#45=
22</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_cdclk@mode-transition-al=
l-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_chamelium_color@ctm-neg=
ative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-433/igt@kms_chamelium_edid@dp-edid-=
change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid=
-change-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_content_protection@srm@=
pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cursor_crc@cursor-random-=
32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_crc@cursor-slidin=
g-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_cursor_legacy@cursora-vs-=
flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-6/ig=
t@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#=
2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_display_modes@extended-m=
ode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_dp_link_training@non-uhb=
r-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_feature_discovery@displa=
y-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-ch=
eck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@kms_fli=
p@dpms-off-confusion-interruptible@c-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/i=
gt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_flip@flip-vs-expired-vbl=
ank-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +13 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-7/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-5/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-432/igt@kms_flip@flip-vs-s=
uspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test=
 incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2=
293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4921">Intel XE#4921</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
stridechange.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +51 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_hdr@static-swap.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
>Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_joiner@switch-modeset-ul=
tra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@kms_plane_lowres@tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_plane_multiple@2x-tiling=
-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_plane_multiple@tiling-yf=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_pm_dc@dc5-retention-flop=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">=
Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-l=
psp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6070">Intel XE#6070</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-n=
on-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@kms_pm_=
rpm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@kms_pm_rpm@legacy-pla=
nes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6070">Intel XE#6070</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_psr2_sf@psr2-cursor-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-466/igt@kms_psr2_sf@psr2-primary-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb88=
88.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5580">Intel XE#5580</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@kms_psr@fbc-psr2-cursor-plan=
e-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_psr@pr-suspend.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_rotation_crc@sprite-rota=
tion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_ccs@block-copy-compressed=
-inc-dimension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5607">Intel XE#5607</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_create@multigpu-create-ma=
ssive-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_eudebug@basic-exec-queues=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5565">Intel XE#5565</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_eudebug@basic-vm-access.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-fa=
ultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_evict@evict-beng-threads-=
large.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/261">Intel XE#261</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_evict@evict-large-externa=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5564">Intel XE#5564</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_evict@evict-small-multi-v=
m.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5564">Intel XE#5564</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_exec_basic@multigpu-once-=
bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a>) +12=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +30 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_exec_fault_mode@twice-us=
erptr-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_exec_mix_modes@exec-simpl=
e-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-free-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-lnl-3/igt@xe_exec_system_allocator@once=
-large-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_exec_system_allocator@onc=
e-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +308 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_faul=
t_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/s=
hard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lme=
m_ready.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5530">Intel XE#5530</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bm=
g-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
530">Intel XE#5530</a>) +7 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_fault_injection@vm-create=
-fail-xe_exec_queue_create_bind.html">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5100">Intel XE#5100</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_mmap@small-bar.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">I=
ntel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-ad=
lp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750ba=
d/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9=
750bad/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca44a976=
0d9f9750bad/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0bfca4=
4a9760d9f9750bad/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a240324a2d0=
bfca44a9760d9f9750bad/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a24032=
4a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a6de7a=
240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935-bf6a=
6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3935=
-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adl=
p-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55314v3/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shar=
d-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155314v3/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314=
v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adl=
p-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/378">Intel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5612">Intel XE#5612</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155314v3/shard-bmg-5/igt@xe_module_load@many-reload=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5087">Intel XE#5087</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-464/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@xe_module_load@r=
eload-no-display.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5087">Intel XE#5087</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-5/igt@xe_modul=
e_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-8/igt@xe_module_load@reloa=
d-no-display.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5087">Intel XE#5087</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_oa@buffer-size.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032">=
Intel XE#6032</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_oa@invalid-oa-exponent.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-8/igt@xe_oa@syncs-syncobj-cfg.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3573">Intel XE#3573</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_pm@d3hot-i2c.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">In=
tel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-6/igt@xe_pm@s2idle-d3hot-basic-exe=
c.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4504">Intel XE#4504</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-7/igt@xe_pm@s2=
idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basi=
c-exec.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4504">Intel XE#4504</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-lnl-4/igt@xe_pm@s2=
idle-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155314v3/shard-lnl-4/igt@xe_pm@s2idle-d3hot-basi=
c-exec.html">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_pm@s4-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-9/igt@xe_pxp@display-black-pxp-fb.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-bind-pos=
t-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5594">Intel XE#5594</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-adlp-2/igt@xe_render_copy@render-stress=
-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5614">Intel XE#5614</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_render_copy@render-stres=
s-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
resources-released-on-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other t=
est skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE=
#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_async_flips@async-flip-suspend=
-resume@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE=
#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2=
705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
12">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6014">Intel XE#6014</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-434/igt@kms_ccs@random-ccs-da=
ta-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2=
-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-4=
33/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155314v3/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_flip@2x-=
nonexisting-fb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-2/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-dg2-463/igt@kms_pm=
_rpm@basic-pci-d3-state.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4741">Intel XE#4741</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-dg2-463/igt@kms_p=
m_rpm@basic-pci-d3-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@xe_evict=
@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg=
-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_pmu@fn-engine-activity-sched-if-idle@engine-drm_xe_engine_class_=
video_enhance1}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-2/igt@xe_pmu@f=
n-engine-activity-sched-if-idle@engine-drm_xe_engine_class_video_enhance1.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3876">Intel XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155314v3/shard-bmg-3/igt@xe_pmu@fn-engine-activity-=
sched-if-idle@engine-drm_xe_engine_class_video_enhance1.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4=
173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
43">Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-r=
esume.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155314v3/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
14v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-155314v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
14v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
14v3/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad/shard-adlp-2/igt@kms_pm_=
rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155314v3/shard-adlp-1/igt@kms_pm_rpm@=
modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6070">Intel XE#6070</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad -&gt; xe-pw-155=
314v3</li>
</ul>
<p>IGT_8588: 8588<br />
  xe-3935-bf6a6de7a240324a2d0bfca44a9760d9f9750bad: bf6a6de7a240324a2d0bfca=
44a9760d9f9750bad<br />
  xe-pw-155314v3: 155314v3</p>

</body>
</html>

--===============7960302623427750264==--
