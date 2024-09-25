Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE28CCF9E7
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 19:22:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2E410E2EF;
	Wed, 25 Sep 2024 19:22:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF81A10E2EF;
 Wed, 25 Sep 2024 19:22:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6105658573167931450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/cx0=3A_Set_power_state_?=
 =?utf-8?q?to_ready_only_on_owned_PHY_lanes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vamsi Krishna Brahmajosyula" <vamsikrishna.brahmajosyula@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 19:22:56 -0000
Message-ID: <172729217690.1102567.8238254905387932591@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
In-Reply-To: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
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

--===============6105658573167931450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: Set power state to ready only on owned PHY lanes (rev3)
URL   : https://patchwork.freedesktop.org/series/138990/
State : failure

== Summary ==

CI Bug Log - changes from xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47_BAT -> xe-pw-138990v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138990v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138990v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138990v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Warnings ####

  * igt@fbdev@eof:
    - bat-adlp-vf:        [SKIP][3] ([Intel XE#2134]) -> [SKIP][4] +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@fbdev@eof.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@fbdev@eof.html

  * igt@kms_addfb_basic@unused-offsets:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2461]) -> [SKIP][6] +30 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-lnl-2:          [SKIP][7] ([Intel XE#929]) -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-adlp-vf:        [SKIP][9] ([Intel XE#2460]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-pvc-2:          [SKIP][11] ([Intel XE#2691]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-adlp-vf:        [SKIP][13] ([Intel XE#2464]) -> [SKIP][14] +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html
    - bat-pvc-2:          [SKIP][15] ([Intel XE#1021]) -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_intel_bb@render:
    - bat-pvc-2:          [SKIP][17] ([Intel XE#532]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_intel_bb@render.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_intel_bb@render.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         [SKIP][19] ([Intel XE#977]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-vf:        [SKIP][21] ([Intel XE#977]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html
    - bat-pvc-2:          [SKIP][23] ([Intel XE#977]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pat@pat-index-xe2.html
    - bat-adlp-7:         [SKIP][25] ([Intel XE#977]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#977]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc@render:
    - bat-pvc-2:          [SKIP][29] ([Intel XE#976]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-bmg-1:          [SKIP][31] ([Intel XE#2236]) -> [SKIP][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        [SKIP][33] ([Intel XE#2468]) -> [SKIP][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html
    - bat-pvc-2:          [SKIP][35] ([Intel XE#531]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_frontbuffer_tracking@basic:
    - {bat-bmg-2}:        [SKIP][37] ([Intel XE#2434] / [Intel XE#2548]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_pat@pat-index-xelpg:
    - {bat-bmg-2}:        [SKIP][39] ([Intel XE#2236]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html

  
Known issues
------------

  Here are the changes found in xe-pw-138990v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][41] -> [FAIL][42] ([Intel XE#1861])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [PASS][43] -> [FAIL][44] ([Intel XE#1649]) +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-lnl-2:          [SKIP][45] ([Intel XE#2235] / [Intel XE#2548]) -> [SKIP][46] ([Intel XE#2235])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-lnl-1:          [SKIP][47] ([Intel XE#1470]) -> [SKIP][48] ([Intel XE#2853])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html
    - bat-lnl-2:          [SKIP][49] ([Intel XE#1470] / [Intel XE#2235]) -> [SKIP][50] ([Intel XE#2235] / [Intel XE#2853])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][51] ([Intel XE#929]) -> [SKIP][52] ([Intel XE#2850]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-bmg-1:          [SKIP][53] ([Intel XE#2234]) -> [SKIP][54] ([Intel XE#2850]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][55] ([Intel XE#1091]) -> [SKIP][56] ([Intel XE#2849]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-1:          [SKIP][57] ([Intel XE#1091]) -> [SKIP][58] ([Intel XE#2849]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-lnl-2:          [SKIP][59] ([Intel XE#1091]) -> [SKIP][60] ([Intel XE#2849]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-dg2-oem2:       [SKIP][61] ([Intel XE#1091]) -> [SKIP][62] ([Intel XE#2849]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][63] ([Intel XE#1420]) -> [SKIP][64] ([Intel XE#2838])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-7:         [SKIP][65] ([Intel XE#979]) -> [SKIP][66] ([Intel XE#2838])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][67] ([Intel XE#1420]) -> [SKIP][68] ([Intel XE#2838])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-dg2-oem2:       [SKIP][69] ([Intel XE#979]) -> [SKIP][70] ([Intel XE#2838])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
    - bat-atsm-2:         [SKIP][71] ([Intel XE#979]) -> [SKIP][72] ([Intel XE#2838])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html
    - bat-adlp-vf:        [SKIP][73] ([Intel XE#979]) -> [SKIP][74] ([Intel XE#2838])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-2:          [SKIP][75] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][76] ([Intel XE#979])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460
  [Intel XE#2461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461
  [Intel XE#2464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2691]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2691
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#531]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/531
  [Intel XE#532]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/532
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/976
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8031 -> IGT_8032
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-pw-138990v3

  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-pw-138990v3: 138990v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/index.html

--===============6105658573167931450==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: Set power state to ready only on owned PHY lanes (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138990/">https://patchwork.freedesktop.org/series/138990/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47_BAT -&gt; xe-pw-138990v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138990v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138990v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138990v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@fbdev@eof.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@unused-offsets:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2461">Intel XE#2461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@kms_addfb_basic@unused-offsets.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2460">Intel XE#2460</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2691">Intel XE#2691</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2464">Intel XE#2464</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +2 other tests skip</li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1021">Intel XE#1021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/532">Intel XE#532</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_intel_bb@render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/976">Intel XE#976</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pat@pat-index-xehpc@render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/531">Intel XE#531</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-pvc-2/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138990v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2235">Intel XE#2235</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-adlp-vf/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138990v3/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8031 -&gt; IGT_8032</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-pw-138990v3</li>
</ul>
<p>IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-pw-138990v3: 138990v3</p>

</body>
</html>

--===============6105658573167931450==--
