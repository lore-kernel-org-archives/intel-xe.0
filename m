Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AE9CCF9EE
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 20:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8AC10E864;
	Wed, 25 Sep 2024 20:07:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CFB10E864;
 Wed, 25 Sep 2024 20:07:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2008339432087194608=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Introduce_DRM_device_wedged_eve?=
 =?utf-8?q?nt_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Sep 2024 20:07:12 -0000
Message-ID: <172729483258.1102786.12436329106834628384@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240923035826.624196-1-raag.jadav@intel.com>
In-Reply-To: <20240923035826.624196-1-raag.jadav@intel.com>
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

--===============2008339432087194608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM device wedged event (rev4)
URL   : https://patchwork.freedesktop.org/series/138070/
State : failure

== Summary ==

CI Bug Log - changes from xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47_full -> xe-pw-138070v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138070v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138070v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138070v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][1] +13 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1:
    - shard-lnl:          [PASS][4] -> [INCOMPLETE][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1.html

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:
    - shard-lnl:          [PASS][6] -> [DMESG-WARN][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] +6 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [FAIL][9] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] +52 other tests fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][12] -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [PASS][14] -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html
    - shard-dg2-set2:     [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][18] -> [TIMEOUT][19] +1 other test timeout
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][20] +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          [SKIP][21] ([Intel XE#1125]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-2/igt@intel_hwmon@hwmon-write.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@intel_hwmon@hwmon-write.html

  * igt@kms_3d:
    - shard-lnl:          [SKIP][23] ([Intel XE#1465]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_3d.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_3d.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          [SKIP][25] ([Intel XE#873]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_async_flips@invalid-async-flip.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-lnl:          [SKIP][27] ([Intel XE#346]) -> [SKIP][28] +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          [SKIP][29] ([Intel XE#1137]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_feature_discovery@dp-mst.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          [SKIP][31] ([Intel XE#1421]) -> [SKIP][32] +34 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][33] ([Intel XE#1469]) -> [SKIP][34] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-lnl:          [SKIP][35] ([Intel XE#2340]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          [SKIP][37] ([Intel XE#1470]) -> [SKIP][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-adlp:         [FAIL][39] ([Intel XE#361]) -> [FAIL][40] +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@intel-max-src-size.html
    - shard-dg2-set2:     [FAIL][41] ([Intel XE#361]) -> [FAIL][42] +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     [SKIP][43] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][44] +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          [SKIP][45] ([Intel XE#2763]) -> [SKIP][46] +89 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][47] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][49] ([Intel XE#1131]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][51] ([Intel XE#718]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][53] ([Intel XE#718]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][55] ([Intel XE#1430]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][57] ([Intel XE#1439]) -> [SKIP][58] +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][60] +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][61] ([Intel XE#1128]) -> [SKIP][62] +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][63] ([Intel XE#929]) -> [SKIP][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@pr-dpms.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][66] +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_sysfs_edid_timing:
    - shard-adlp:         [FAIL][67] ([Intel XE#1174]) -> [FAIL][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_sysfs_edid_timing.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_sysfs_edid_timing.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][69] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-lnl:          [SKIP][71] ([Intel XE#1091]) -> [SKIP][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          [SKIP][75] ([Intel XE#1062]) -> [SKIP][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_create@create-big-vram.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          [SKIP][77] ([Intel XE#688]) -> [SKIP][78] +36 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          [SKIP][79] ([Intel XE#1392]) -> [SKIP][80] +43 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][82] +12 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#288]) -> [SKIP][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][85] ([Intel XE#1999]) -> [FAIL][86] +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@load:
    - shard-lnl:          [SKIP][87] ([Intel XE#378]) -> [SKIP][88] +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_module_load@load.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][90] +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_oa@missing-sample-flags.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          [SKIP][91] ([Intel XE#2248]) -> [SKIP][92] +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          [SKIP][93] ([Intel XE#1061]) -> [SKIP][94] +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-2/igt@xe_peer2peer@read.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          [SKIP][95] ([Intel XE#2284]) -> [SKIP][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_pm@d3cold-mocs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          [SKIP][97] ([Intel XE#579]) -> [SKIP][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          [SKIP][99] ([Intel XE#944]) -> [SKIP][100] +15 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][102] +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@invalid-async-flip:
    - {shard-bmg}:        [SKIP][103] ([Intel XE#873]) -> [SKIP][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - {shard-bmg}:        [SKIP][105] ([Intel XE#2328]) -> [SKIP][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_joiner@invalid-modeset:
    - {shard-bmg}:        [SKIP][107] ([Intel XE#346]) -> [SKIP][108] +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_big_joiner@invalid-modeset.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - {shard-bmg}:        [SKIP][109] ([Intel XE#2314]) -> [SKIP][110] +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - {shard-bmg}:        [SKIP][111] ([Intel XE#2251]) -> [SKIP][112] +76 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - {shard-bmg}:        [SKIP][113] ([Intel XE#2724]) -> [SKIP][114] +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - {shard-bmg}:        [SKIP][115] ([Intel XE#2325]) -> [SKIP][116] +8 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - {shard-bmg}:        [SKIP][117] ([Intel XE#2252]) -> [SKIP][118] +50 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - {shard-bmg}:        [SKIP][119] ([Intel XE#2321]) -> [SKIP][120] +8 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - {shard-bmg}:        [SKIP][121] ([Intel XE#2286]) -> [SKIP][122] +5 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - {shard-bmg}:        [PASS][123] -> [SKIP][124] +12 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - {shard-bmg}:        [SKIP][125] ([Intel XE#2323]) -> [SKIP][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@chamelium:
    - {shard-bmg}:        [SKIP][127] ([Intel XE#2372]) -> [SKIP][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - {shard-bmg}:        [SKIP][129] ([Intel XE#2373]) -> [SKIP][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - {shard-bmg}:        [SKIP][131] ([Intel XE#1138]) -> [SKIP][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_feature_discovery@display-4x.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - {shard-bmg}:        [SKIP][133] ([Intel XE#2375]) -> [SKIP][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - {shard-bmg}:        [SKIP][135] ([Intel XE#2374]) -> [SKIP][136] +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_feature_discovery@psr1.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - {shard-bmg}:        [DMESG-WARN][137] ([Intel XE#877]) -> [SKIP][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - {shard-bmg}:        [SKIP][139] ([Intel XE#2293]) -> [SKIP][140] +25 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - {shard-bmg}:        [SKIP][141] ([Intel XE#2311]) -> [SKIP][142] +143 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - {shard-bmg}:        NOTRUN -> [FAIL][143] +3 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - {shard-bmg}:        [FAIL][144] ([Intel XE#2333]) -> [FAIL][145] +33 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - {shard-bmg}:        [SKIP][146] ([Intel XE#2352]) -> [SKIP][147] +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - {shard-bmg}:        [SKIP][148] ([Intel XE#2350]) -> [SKIP][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - {shard-bmg}:        [SKIP][150] ([Intel XE#2313]) -> [SKIP][151] +148 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - {shard-bmg}:        [SKIP][152] ([Intel XE#2340]) -> [SKIP][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - {shard-bmg}:        [INCOMPLETE][154] ([Intel XE#2594]) -> [SKIP][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - {shard-bmg}:        NOTRUN -> [SKIP][156] +70 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - {shard-bmg}:        [SKIP][157] ([Intel XE#2763]) -> [SKIP][158] +64 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - {shard-bmg}:        [SKIP][159] ([Intel XE#870]) -> [SKIP][160] +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - {shard-bmg}:        [SKIP][161] ([Intel XE#2391]) -> [SKIP][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-psr:
    - {shard-bmg}:        [SKIP][163] ([Intel XE#2392]) -> [SKIP][164] +1 other test skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - {shard-bmg}:        [SKIP][165] ([Intel XE#2505]) -> [SKIP][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - {shard-bmg}:        [SKIP][167] ([Intel XE#1439]) -> [SKIP][168] +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - {shard-bmg}:        [SKIP][169] ([Intel XE#1489]) -> [SKIP][170] +22 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - {shard-bmg}:        [SKIP][171] ([Intel XE#2387]) -> [SKIP][172] +2 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - {shard-bmg}:        [SKIP][173] ([Intel XE#2234]) -> [SKIP][174] +74 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - {shard-bmg}:        [SKIP][175] ([Intel XE#2414]) -> [SKIP][176] +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - {shard-bmg}:        [SKIP][177] ([Intel XE#2330]) -> [SKIP][178] +2 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_tv_load_detect@load-detect:
    - {shard-bmg}:        [SKIP][179] ([Intel XE#2450]) -> [SKIP][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@cmrr:
    - {shard-bmg}:        [SKIP][181] ([Intel XE#2168]) -> [SKIP][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_vrr@cmrr.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_vrr@cmrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - {shard-bmg}:        [SKIP][183] ([Intel XE#1091]) -> [SKIP][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_create@multigpu-create-massive-size:
    - {shard-bmg}:        [SKIP][185] ([Intel XE#2504]) -> [SKIP][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - {shard-bmg}:        [SKIP][187] ([Intel XE#2322]) -> [SKIP][188] +47 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - {shard-bmg}:        [PASS][189] -> [FAIL][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_exec_reset@gt-reset-stress.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_mmap@small-bar:
    - {shard-bmg}:        [SKIP][191] ([Intel XE#586]) -> [SKIP][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_mmap@small-bar.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - {shard-bmg}:        [SKIP][193] ([Intel XE#2457]) -> [SKIP][194] +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_module_load@force-load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_module_load@force-load.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - {shard-bmg}:        [SKIP][195] ([Intel XE#2248]) -> [SKIP][196] +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@xe_oa@unprivileged-single-ctx-counters.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xelpg:
    - {shard-bmg}:        [SKIP][197] ([Intel XE#2236]) -> [SKIP][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - {shard-bmg}:        [SKIP][199] ([Intel XE#2427]) -> [SKIP][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@xe_peer2peer@write.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_peer2peer@write.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - {shard-bmg}:        [SKIP][201] ([Intel XE#2284]) -> [SKIP][202] +8 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - {shard-bmg}:        [SKIP][203] ([Intel XE#579]) -> [SKIP][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - {shard-bmg}:        [SKIP][205] ([Intel XE#944]) -> [SKIP][206] +13 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
Known issues
------------

  Here are the changes found in xe-pw-138070v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][207] ([Intel XE#1201] / [Intel XE#660])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][208] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][209] -> [FAIL][210] ([Intel XE#1659])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#1201] / [Intel XE#316])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][212] ([Intel XE#1407]) +3 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][213] ([Intel XE#1874])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][214] -> [FAIL][215] ([Intel XE#1231]) +2 other tests fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#1428])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#1124]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#2191])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][220] ([Intel XE#1201] / [Intel XE#2191])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#367])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#1201] / [Intel XE#367])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#1201] / [Intel XE#367])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][225] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#787]) +6 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#1201] / [Intel XE#1252])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#1399]) +5 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][232] -> [INCOMPLETE][233] ([Intel XE#1195]) +1 other test incomplete
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#1252])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#1201] / [Intel XE#306])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#1201] / [Intel XE#306]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@gamma:
    - shard-lnl:          NOTRUN -> [SKIP][237] ([Intel XE#306])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-lnl:          NOTRUN -> [SKIP][238] ([Intel XE#373]) +3 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][239] ([Intel XE#373])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][241] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][242] ([Intel XE#599])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][243] ([Intel XE#1188]) +1 other test fail
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#308])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][245] ([Intel XE#1413]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][246] ([Intel XE#1201] / [Intel XE#308])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#1424]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][248] ([Intel XE#309]) +3 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][249] ([Intel XE#1201] / [Intel XE#309]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-lnl:          [PASS][250] -> [SKIP][251] ([Intel XE#1508])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@display-3x:
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#1201] / [Intel XE#703])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][254] -> [INCOMPLETE][255] ([Intel XE#2049] / [Intel XE#2597])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [PASS][256] -> [FAIL][257] ([Intel XE#886]) +2 other tests fail
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][259] ([Intel XE#1401]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [PASS][260] -> [DMESG-FAIL][261] ([Intel XE#324]) +1 other test dmesg-fail
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#651]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][263] -> [FAIL][264] ([Intel XE#1861]) +2 other tests fail
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][265] ([Intel XE#656]) +13 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][266] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][267] ([Intel XE#1201] / [Intel XE#651]) +18 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][268] ([Intel XE#651]) +6 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][270] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#1201] / [Intel XE#653]) +17 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-lnl:          [PASS][272] -> [INCOMPLETE][273] ([Intel XE#2050])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][274] ([Intel XE#653]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][275] ([Intel XE#1201] / [Intel XE#455]) +8 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-lnl:          [PASS][276] -> [INCOMPLETE][277] ([Intel XE#2622]) +1 other test incomplete
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][278] ([Intel XE#616]) +3 other tests fail
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][279] -> [DMESG-WARN][280] ([Intel XE#2687])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_plane_cursor@primary.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][281] -> [FAIL][282] ([Intel XE#1874]) +3 other tests fail
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][283] ([Intel XE#455]) +3 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#1201]) +17 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][285] ([Intel XE#1201] / [Intel XE#455]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][286] ([Intel XE#1201] / [Intel XE#836])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [PASS][287] -> [DMESG-WARN][288] ([Intel XE#1620])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][289] -> [FAIL][290] ([Intel XE#1649]) +97 other tests fail
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [FAIL][291] ([Intel XE#1649]) +9 other tests fail
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#1406]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr@pr-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][293] ([Intel XE#1127] / [Intel XE#1201])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#1201] / [Intel XE#1500])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-adlp:         NOTRUN -> [SKIP][295] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][296] ([Intel XE#1201] / [Intel XE#1447])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][297] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][298] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][299] ([Intel XE#1473])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][300] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][301] -> [TIMEOUT][302] ([Intel XE#1473]) +1 other test timeout
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][303] ([Intel XE#688]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [PASS][304] -> [DMESG-FAIL][305] ([Intel XE#1069])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][306] ([Intel XE#288]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@twice-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][307] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][308] ([Intel XE#1201] / [Intel XE#288]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][309] ([Intel XE#1201] / [Intel XE#560])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     NOTRUN -> [SKIP][310] ([Intel XE#1201]) +26 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][311] ([Intel XE#1173]) +1 other test fail
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][312] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][313] ([Intel XE#584])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][314] -> [INCOMPLETE][315] ([Intel XE#1195] / [Intel XE#569])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][316] -> [ABORT][317] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][318] -> [ABORT][319] ([Intel XE#1358] / [Intel XE#1607])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][320] -> [ABORT][321] ([Intel XE#1794])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][322] ([Intel XE#324]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [FAIL][324] ([Intel XE#1426]) -> [PASS][325] +1 other test pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][326] ([Intel XE#1659]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][328] ([Intel XE#1231]) -> [PASS][329] +1 other test pass
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][330] ([Intel XE#1204]) -> [PASS][331] +1 other test pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][332] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@torture-move:
    - shard-adlp:         [DMESG-WARN][334] ([Intel XE#877]) -> [PASS][335] +1 other test pass
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_cursor_legacy@torture-move.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][336] ([Intel XE#324]) -> [PASS][337] +3 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [FAIL][338] ([Intel XE#1874]) -> [PASS][339] +9 other tests pass
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [FAIL][340] ([Intel XE#1861]) -> [PASS][341]
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-dg2-set2:     [INCOMPLETE][342] ([Intel XE#1195]) -> [PASS][343] +3 other tests pass
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [FAIL][344] ([Intel XE#2443]) -> [PASS][345] +1 other test pass
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@xe_exec_balancer@twice-cm-parallel-rebind:
    - {shard-bmg}:        [DMESG-WARN][346] ([Intel XE#877]) -> [PASS][347] +2 other tests pass
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_exec_balancer@twice-cm-parallel-rebind.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_exec_balancer@twice-cm-parallel-rebind.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [INCOMPLETE][348] ([Intel XE#1358] / [Intel XE#1616]) -> [PASS][349]
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - {shard-bmg}:        [INCOMPLETE][350] ([Intel XE#1616]) -> [PASS][351]
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-userptr.html
    - shard-dg2-set2:     [INCOMPLETE][352] ([Intel XE#1195] / [Intel XE#1694]) -> [PASS][353]
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html

  
#### Warnings ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         [SKIP][354] ([Intel XE#1125] / [Intel XE#1201]) -> [SKIP][355] ([Intel XE#1201]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@intel_hwmon@hwmon-write.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][356] ([Intel XE#324]) -> [DMESG-WARN][357] ([Intel XE#1033])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#873]) -> [SKIP][359] ([Intel XE#1201])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][361] ([Intel XE#316]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#316]) -> [SKIP][363] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][364] ([Intel XE#324]) -> [FAIL][365] ([Intel XE#1231])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][366] ([Intel XE#324]) -> [FAIL][367] ([Intel XE#1231])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#619]) -> [SKIP][369] ([Intel XE#1201] / [Intel XE#619])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][370] ([Intel XE#1231]) -> [DMESG-FAIL][371] ([Intel XE#324])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#1124]) -> [SKIP][373] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#607]) -> [SKIP][375] ([Intel XE#1201] / [Intel XE#607])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][377] ([Intel XE#1124]) +7 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][379] ([Intel XE#1201])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_big_joiner@basic.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_big_joiner@basic.html

  * igt@kms_big_joiner@invalid-modeset:
    - shard-adlp:         [SKIP][380] ([Intel XE#1201] / [Intel XE#346]) -> [SKIP][381] ([Intel XE#1201])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#346]) -> [SKIP][383] ([Intel XE#1201])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][385] ([Intel XE#2191])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][387] ([Intel XE#367]) +1 other test skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#367]) -> [SKIP][389] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][391] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#787]) -> [SKIP][393] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][395] ([Intel XE#787]) +62 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][397] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#306]) -> [SKIP][399] ([Intel XE#1201] / [Intel XE#306])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][401] ([Intel XE#306])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#373]) -> [SKIP][403] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][405] ([Intel XE#373]) +4 other tests skip
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [INCOMPLETE][406] ([Intel XE#1195] / [Intel XE#2715]) -> [FAIL][407] ([Intel XE#1178] / [Intel XE#1204])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_content_protection@lic-type-0.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][408] ([Intel XE#1195]) -> [FAIL][409] ([Intel XE#1204])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][411] ([Intel XE#308]) +2 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#323]) -> [SKIP][413] ([Intel XE#1201] / [Intel XE#323])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][415] ([Intel XE#323])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][417] ([Intel XE#455]) +10 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#455]) -> [SKIP][419] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][421] ([Intel XE#701])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         [SKIP][422] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][423] ([Intel XE#1201])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_feature_discovery@display-4x.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-adlp:         [SKIP][424] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][425] ([Intel XE#1201])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#1137]) -> [SKIP][427] ([Intel XE#1201])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         [SKIP][428] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][429] ([Intel XE#1201]) +1 other test skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_feature_discovery@psr1.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][431] ([Intel XE#1201]) +1 other test skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_feature_discovery@psr1.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-adlp:         [SKIP][432] ([Intel XE#1151] / [Intel XE#1201]) -> [SKIP][433] ([Intel XE#1201]) +2 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#658]) -> [SKIP][435] ([Intel XE#1201])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#651]) -> [SKIP][437] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][439] ([Intel XE#651]) +15 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][441] ([Intel XE#1201])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#1158] / [Intel XE#1201]) -> [SKIP][443] ([Intel XE#1158])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#653]) -> [SKIP][445] ([Intel XE#1201] / [Intel XE#653]) +20 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][447] ([Intel XE#653]) +18 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          [SKIP][448] ([Intel XE#1470]) -> [SKIP][449] ([Intel XE#2853])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [SKIP][450] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][451] ([Intel XE#1201] / [Intel XE#455]) +17 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][453] ([Intel XE#455]) +1 other test skip
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][455] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][457] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#2763]) -> [SKIP][459] ([Intel XE#1201]) +2 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         [SKIP][460] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][461] ([Intel XE#1201]) +26 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][463] ([Intel XE#1201]) +14 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-adlp:         [SKIP][464] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][465] ([Intel XE#1201]) +4 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_backlight@fade.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][467] ([Intel XE#1201]) +2 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1129]) -> [SKIP][469] ([Intel XE#1201])
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][471] ([Intel XE#1201]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         [SKIP][472] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][473] ([Intel XE#1201])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#1129] / [Intel XE#1201]) -> [SKIP][475] ([Intel XE#1201])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-adlp:         [SKIP][476] ([Intel XE#1201] / [Intel XE#2007]) -> [SKIP][477] ([Intel XE#1201])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#1489]) -> [SKIP][479] ([Intel XE#1201]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][481] ([Intel XE#1201]) +17 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][483] ([Intel XE#1201]) +3 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-adlp:         [SKIP][484] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][485] ([Intel XE#1201]) +4 other tests skip
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#929]) -> [SKIP][487] ([Intel XE#1201]) +7 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         [SKIP][488] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][489] ([Intel XE#1201]) +82 other tests skip
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_psr@psr-basic.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_psr@psr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][491] ([Intel XE#1201]) +56 other tests skip
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_psr@psr-dpms.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#929]) -> [SKIP][493] ([Intel XE#1201] / [Intel XE#2850])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][495] ([Intel XE#1201] / [Intel XE#2850]) +1 other test skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][497] ([Intel XE#1201]) +1 other test skip
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         [SKIP][498] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][499] ([Intel XE#1201]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][500] ([Intel XE#2168]) -> [SKIP][501] ([Intel XE#1201])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_vrr@cmrr.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         [SKIP][502] ([Intel XE#1201] / [Intel XE#2168]) -> [SKIP][503] ([Intel XE#1201]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_vrr@lobf.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#756]) -> [SKIP][505] ([Intel XE#1201] / [Intel XE#756])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_writeback@writeback-check-output.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][507] ([Intel XE#756])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][509] ([Intel XE#1201] / [Intel XE#2849])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - shard-lnl:          [SKIP][510] ([Intel XE#1091]) -> [SKIP][511] ([Intel XE#2849])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         [SKIP][512] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][513] ([Intel XE#1201]) +3 other tests skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][515] ([Intel XE#1201]) +3 other tests skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         [SKIP][516] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][517] ([Intel XE#1201]) +3 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][519] ([Intel XE#1201]) +1 other test skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         [SKIP][520] ([Intel XE#1062] / [Intel XE#1201]) -> [SKIP][521] ([Intel XE#1201])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_create@create-big-vram.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][522] ([Intel XE#1473]) -> [FAIL][523] ([Intel XE#1000])
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][524] ([Intel XE#1201] / [Intel XE#1392]) -> [SKIP][525] ([Intel XE#1201]) +49 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-adlp:         [SKIP][526] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][527] ([Intel XE#1201]) +111 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@many-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#288]) -> [SKIP][529] ([Intel XE#1201]) +12 other tests skip
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][530] ([Intel XE#288]) -> [SKIP][531] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][533] ([Intel XE#288]) +2 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][535] ([Intel XE#1201]) +82 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         [SKIP][536] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][537] ([Intel XE#1201]) +2 other tests skip
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#1201] / [Intel XE#2360]) -> [SKIP][539] ([Intel XE#1201]) +2 other tests skip
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#2360]) -> [SKIP][541] ([Intel XE#1201])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         [SKIP][542] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][543] ([Intel XE#1201]) +1 other test skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_module_load@force-load.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_module_load@force-load.html
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][545] ([Intel XE#1201]) +1 other test skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_module_load@force-load.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_module_load@force-load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][547] ([Intel XE#1201]) +21 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         [SKIP][548] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][549] ([Intel XE#1201]) +32 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#2541]) -> [SKIP][551] ([Intel XE#1201]) +4 other tests skip
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][552] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][553] ([Intel XE#1201])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_pat@pat-index-xe2.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][555] ([Intel XE#1201])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         [SKIP][556] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][557] ([Intel XE#1201] / [Intel XE#2838])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#1201] / [Intel XE#979]) -> [SKIP][559] ([Intel XE#1201] / [Intel XE#2838])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
    - shard-lnl:          [SKIP][560] ([Intel XE#1420]) -> [SKIP][561] ([Intel XE#2838])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         [SKIP][562] ([Intel XE#1061] / [Intel XE#1201]) -> [SKIP][563] ([Intel XE#1201]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_peer2peer@read.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][564] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][565] ([Intel XE#366]) +7 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@xe_pm@d3cold-basic.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][567] ([Intel XE#1201] / [Intel XE#366]) +5 other tests skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-adlp:         [SKIP][568] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][569] ([Intel XE#1201])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@d3cold-mocs.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_pm@d3cold-mocs.html
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#1201] / [Intel XE#2284]) -> [SKIP][571] ([Intel XE#1201])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         [SKIP][572] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][573] ([Intel XE#1201] / [Intel XE#366]) +5 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][575] ([Intel XE#366])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][577] ([Intel XE#1201] / [Intel XE#366])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][578] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][579] ([Intel XE#1201])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         [SKIP][580] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][581] ([Intel XE#1201])
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         [SKIP][582] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][583] ([Intel XE#1201]) +14 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][584] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][585] ([Intel XE#1201]) +10 other tests skip
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#944]) -> [SKIP][587] ([Intel XE#1201]) +1 other test skip
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2622]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8031 -> IGT_8032
  * Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -> xe-pw-138070v4

  IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8032: 8032
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47
  xe-pw-138070v4: 138070v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/index.html

--===============2008339432087194608==
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
<tr><td><b>Series:</b></td><td>Introduce DRM device wedged event (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138070/">https://patchwork.freedesktop.org/series/138070/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47_full -&gt; xe-pw-138070v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138070v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138070v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138070v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@intel_hwmon@hwmon-read.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@ad-hdmi-a6-dp4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-edp-1.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-256.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_psr2_sf@fbc-primary-plane-update-sf-dmg-area@psr2-pipe-a-edp-1.html">FAIL</a> +52 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-2/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@intel_hwmon@hwmon-write.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_3d:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_3d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465">Intel XE#1465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_3d.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">SKIP</a> +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_hdmi_inject@inject-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_hdmi_inject@inject-4k.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> +1 other test fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr@pr-dpms.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_sysfs_edid_timing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1174">Intel XE#1174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_sysfs_edid_timing.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_create@create-big-vram.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_module_load@load.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_peer2peer@read.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251">Intel XE#2251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323">Intel XE#2323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_feature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_feature_discovery@display-4x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_feature_discovery@psr1.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> +143 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> +33 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> +148 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@kms_pm_dc@dc5-psr.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_vrr@cmrr.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-2/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_mmap@small-bar.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_module_load@force-load.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-2/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_pat@pat-index-xelpg.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-8/igt@xe_peer2peer@write.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-7/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138070v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413">Intel XE#1413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-3/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2622">Intel XE#2622</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_plane_cursor@primary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_plane_lowres@tiling-x@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@kms_psr@pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@xe_ccs@block-copy-compressed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_exec_fault_mode@twice-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_cursor_legacy@torture-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_cursor_legacy@torture-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_vrr@flip-basic-fastset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-rebind:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-5/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-3/igt@xe_exec_balancer@twice-cm-parallel-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-7/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-bmg-4/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_big_joiner@invalid-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-9/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +56 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_exec_fault_mode@many-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +82 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-2/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-1/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-436/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-7/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-4/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-lnl-8/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-lnl-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-435/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-434/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-adlp-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-adlp-1/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-466/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v4/shard-dg2-463/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8031 -&gt; IGT_8032</li>
<li>Linux: xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47 -&gt; xe-pw-138070v4</li>
</ul>
<p>IGT_8031: 27ba1f4756f12a3694dce6d456aed947f22a8e34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8032: 8032<br />
  xe-1975-abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47: abfe8cf977e1abd1f414b2a90d223cd4dd2f1f47<br />
  xe-pw-138070v4: 138070v4</p>

</body>
</html>

--===============2008339432087194608==--
