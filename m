Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC0C021A9
	for <intel-xe@archiver.kernel.org>; Mon, 17 Feb 2025 20:51:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79A110E293;
	Mon, 17 Feb 2025 20:51:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79B010E5E3;
 Mon, 17 Feb 2025 20:50:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7987293775301395875=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Allow_?=
 =?utf-8?q?display_PHYs_to_reset_power_state_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Feb 2025 20:50:59 -0000
Message-ID: <173982545992.3363767.14434515053137143885@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217111711.639619-1-mika.kahola@intel.com>
In-Reply-To: <20250217111711.639619-1-mika.kahola@intel.com>
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

--===============7987293775301395875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Allow display PHYs to reset power state (rev4)
URL   : https://patchwork.freedesktop.org/series/144103/
State : failure

== Summary ==

CI Bug Log - changes from xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5_full -> xe-pw-144103v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144103v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144103v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144103v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][1] +2 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-lnl:          [PASS][3] -> [CRASH][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_fb_coherency@memset-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][7] +5 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_plane_multiple@tiling-x:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_plane_multiple@tiling-x.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [PASS][9] -> [INCOMPLETE][10] +6 other tests incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_pm_backlight@basic-brightness.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] +581 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1:
    - shard-lnl:          [PASS][13] -> [SKIP][14] +51 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1.html

  * igt@kms_vblank@query-forked:
    - shard-lnl:          NOTRUN -> [FAIL][15] +127 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_vblank@query-forked.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-lnl:          [FAIL][17] ([Intel XE#3719] / [Intel XE#911]) -> [FAIL][18] +3 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][19] ([Intel XE#911]) -> [FAIL][20] +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][21] ([Intel XE#664]) -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_async_flips@test-cursor.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][23] ([Intel XE#1407]) -> [FAIL][24] +13 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-lnl:          [SKIP][25] ([Intel XE#1397] / [Intel XE#1745]) -> [FAIL][26] +4 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [SKIP][27] ([Intel XE#1397]) -> [FAIL][28] +4 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][29] ([Intel XE#2029]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          [SKIP][31] ([Intel XE#2893]) -> [SKIP][32] +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][33] ([Intel XE#2893]) -> [FAIL][34] +16 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@psr2-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][35] ([Intel XE#3924]) -> [FAIL][36] +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_psr@psr2-primary-page-flip@edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_psr@psr2-primary-page-flip@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          [SKIP][37] ([Intel XE#1127]) -> [FAIL][38] +1 other test fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([SKIP][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63]) ([Intel XE#2457]) -> ([DMESG-WARN][64], [DMESG-WARN][65], [DMESG-WARN][66], [DMESG-WARN][67], [DMESG-WARN][68], [DMESG-WARN][69], [DMESG-WARN][70], [DMESG-WARN][71], [DMESG-WARN][72], [DMESG-WARN][73], [DMESG-WARN][74], [DMESG-WARN][75], [DMESG-WARN][76], [DMESG-WARN][77], [DMESG-WARN][78], [DMESG-WARN][79], [DMESG-WARN][80], [DMESG-WARN][81], [DMESG-WARN][82], [DMESG-WARN][83], [DMESG-WARN][84], [DMESG-WARN][85], [DMESG-WARN][86], [DMESG-WARN][87], [DMESG-WARN][88])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-7/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-lnl:          [SKIP][89] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_pm@d3cold-multiple-execs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][91] ([Intel XE#4268]) -> [ABORT][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-144103v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][93] -> [DMESG-WARN][94] ([Intel XE#1033]) +3 other tests dmesg-warn
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#2550] / [Intel XE#3767]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][96] -> [FAIL][97] ([Intel XE#3884]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][98] ([Intel XE#4245])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-lnl:          [PASS][99] -> [SKIP][100] ([Intel XE#4258]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_atomic_transition@modeset-transition.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4258])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#3279])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#4215]) +20 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1124]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][106] ([Intel XE#1033]) +6 other tests dmesg-fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#316]) +4 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#1124]) +6 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#316]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#619])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1124]) +6 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#2191])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [PASS][113] -> [SKIP][114] ([Intel XE#367]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#367]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#367])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#367]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#455] / [Intel XE#787]) +25 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#787]) +29 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#2887]) +8 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2669]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#3432])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#787]) +82 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2907]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#2907]) +2 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#314]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#314]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#314]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#314] / [Intel XE#455]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#306]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#306])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_chamelium_color@ctm-negative.html
    - shard-adlp:         NOTRUN -> [SKIP][133] ([Intel XE#306])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#373]) +9 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][135] ([Intel XE#373]) +8 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#373]) +8 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#307]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_content_protection@dp-mst-lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#307]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#307]) +1 other test skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#455]) +17 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][141] ([Intel XE#1178]) +1 other test fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_content_protection@legacy.html
    - shard-lnl:          NOTRUN -> [INCOMPLETE][142] ([Intel XE#2715])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][143] ([Intel XE#3304])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][144] ([Intel XE#1188])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#308])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-lnl:          [PASS][146] -> [SKIP][147] ([Intel XE#1424]) +10 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1424]) +5 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#309])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#309])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#309]) +3 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#309]) +3 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1:
    - shard-lnl:          [PASS][154] -> [SKIP][155] ([Intel XE#1340]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][156] -> [SKIP][157] ([Intel XE#3009])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_dp_aux_dev.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4294])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#1138])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1138])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#1138])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][162] -> [SKIP][163] ([Intel XE#310]) +6 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#310]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1421]) +5 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#310]) +5 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-lnl:          [PASS][167] -> [FAIL][168] ([Intel XE#3549]) +90 other tests fail
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_flip@blocking-absolute-wf_vblank.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][169] -> [DMESG-WARN][170] ([Intel XE#1033]) +39 other tests dmesg-warn
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_flip@busy-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_flip@busy-flip.html

  * igt@kms_flip@busy-flip@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][171] ([Intel XE#1033]) +7 other tests dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_flip@busy-flip@d-dp4.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][172] ([Intel XE#3149] / [Intel XE#3549]) +2 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][173] ([Intel XE#3549]) +16 other tests fail
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-modeset-vs-hang:
    - shard-lnl:          [PASS][174] -> [FAIL][175] ([Intel XE#3149] / [Intel XE#3549]) +9 other tests fail
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_flip@flip-vs-modeset-vs-hang.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip@flip-vs-modeset-vs-hang.html

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a1:
    - shard-adlp:         [PASS][176] -> [DMESG-WARN][177] ([Intel XE#3868]) +1 other test dmesg-warn
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_flip@flip-vs-rmfb@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][178] ([Intel XE#2953]) +2 other tests dmesg-warn
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][179] ([Intel XE#2955]) +1 other test dmesg-warn
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible:
    - shard-adlp:         [PASS][180] -> [FAIL][181] ([Intel XE#2882])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@kms_flip@plain-flip-fb-recreate-interruptible.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][182] -> [FAIL][183] ([Intel XE#886])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          [PASS][184] -> [FAIL][185] ([Intel XE#3549] / [Intel XE#3650])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][186] ([Intel XE#1401] / [Intel XE#1745]) +4 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][187] ([Intel XE#1401]) +4 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#352])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#651]) +11 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#651]) +11 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#656]) +28 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][192] ([Intel XE#656]) +12 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][193] ([Intel XE#651]) +24 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [PASS][194] -> [DMESG-FAIL][195] ([Intel XE#1033]) +10 other tests dmesg-fail
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][196] -> [SKIP][197] ([Intel XE#656]) +2 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][198] ([Intel XE#658]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][199] ([Intel XE#656]) +28 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][200] ([Intel XE#653]) +15 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#653]) +27 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#1339])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][203] ([Intel XE#2340])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][204] ([Intel XE#1470] / [Intel XE#2853])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][205] ([Intel XE#1503]) +2 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][206] ([Intel XE#346])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-lnl:          [PASS][207] -> [FAIL][208] ([Intel XE#4243]) +3 other tests fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_lease@setcrtc-implicit-plane.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][209] ([Intel XE#2566])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_plane@pixel-format-source-clamping.html
    - shard-adlp:         NOTRUN -> [INCOMPLETE][210] ([Intel XE#1035])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-adlp:         NOTRUN -> [WARN][211] ([Intel XE#2078]) +1 other test warn
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@plane-panning-bottom-right:
    - shard-lnl:          [PASS][212] -> [SKIP][213] ([Intel XE#3380]) +2 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_plane@plane-panning-bottom-right.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_plane@plane-panning-bottom-right.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][214] -> [FAIL][215] ([Intel XE#616]) +1 other test fail
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][216] ([Intel XE#599]) +4 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#3307])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][218] ([Intel XE#4212]) +2 other tests dmesg-warn
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:
    - shard-lnl:          NOTRUN -> [SKIP][219] ([Intel XE#2763]) +19 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-lnl:          [PASS][220] -> [SKIP][221] ([Intel XE#2763]) +51 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][222] ([Intel XE#870])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#870])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#1122])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][225] ([Intel XE#1122])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#1909])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][227] ([Intel XE#1129])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][228] ([Intel XE#1129])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-lnl:          [PASS][229] -> [SKIP][230] ([Intel XE#1439] / [Intel XE#836]) +3 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#836]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][232] ([Intel XE#836])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#1439] / [Intel XE#3141])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#1439] / [Intel XE#836]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#1489]) +6 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#1489]) +3 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-lnl:          [PASS][238] -> [SKIP][239] ([Intel XE#1406]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_psr@fbc-psr2-primary-blt.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][240] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][241] ([Intel XE#1406]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#2939])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][243] ([Intel XE#3414]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
    - shard-lnl:          NOTRUN -> [SKIP][244] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][245] ([Intel XE#1127])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][246] ([Intel XE#3414]) +2 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-lnl:          [PASS][247] -> [SKIP][248] ([Intel XE#2413]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-dg2-set2:     [PASS][249] -> [SKIP][250] ([Intel XE#455])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_setmode@invalid-clone-single-crtc.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][251] ([Intel XE#455]) +12 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#2168])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][253] ([Intel XE#2168])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_vrr@lobf.html
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#1499])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#756]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#756])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][257] ([Intel XE#756])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         NOTRUN -> [SKIP][258] ([Intel XE#455] / [Intel XE#488])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#1447])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#1447])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][261] ([Intel XE#1123]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][262] ([Intel XE#1123]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][263] ([Intel XE#1126]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][264] ([Intel XE#1126]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][265] ([Intel XE#3889])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#3889]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
    - shard-adlp:         NOTRUN -> [SKIP][267] ([Intel XE#3889]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#2905]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@reset-with-attention:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#2905]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_eudebug_online@reset-with-attention.html
    - shard-lnl:          NOTRUN -> [SKIP][270] ([Intel XE#2905]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_eudebug_online@reset-with-attention.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][271] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_evict@evict-beng-small.html
    - shard-lnl:          NOTRUN -> [SKIP][272] ([Intel XE#688]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#688])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#1392]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][275] ([Intel XE#1392]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#288]) +17 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][277] ([Intel XE#288]) +26 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][278] ([Intel XE#3868])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_exec_reset@cat-error.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-adlp:         [PASS][279] -> [DMESG-WARN][280] ([Intel XE#4173]) +1 other test dmesg-warn
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][281] ([Intel XE#560])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_media_fill@media-fill.html
    - shard-lnl:          NOTRUN -> [SKIP][282] ([Intel XE#560])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#4045]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][284] ([Intel XE#4045]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][285] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][286] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][287] ([Intel XE#977])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][288] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][289] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][290] ([Intel XE#2284] / [Intel XE#366]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][291] ([Intel XE#584])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_pm@s3-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-lnl:          [PASS][292] -> [DMESG-WARN][293] ([Intel XE#3088]) +1 other test dmesg-warn
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_pm_residency@gt-c6-freeze.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     NOTRUN -> [SKIP][294] ([Intel XE#944]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-adlp:         NOTRUN -> [SKIP][295] ([Intel XE#944]) +1 other test skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-lnl:          NOTRUN -> [SKIP][296] ([Intel XE#944]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][297] ([Intel XE#4130]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
    - shard-lnl:          NOTRUN -> [SKIP][298] ([Intel XE#4130])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][299] ([Intel XE#3342])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][300] ([Intel XE#1033]) -> [PASS][301] +3 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][302] ([Intel XE#1033]) -> [PASS][303] +5 other tests pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2191]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][306] ([Intel XE#1727]) -> [PASS][307]
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][308] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113]) -> [PASS][309]
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [DMESG-WARN][310] ([Intel XE#1033]) -> [PASS][311] +45 other tests pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#309]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][314] ([Intel XE#1033]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#310]) -> [PASS][317] +3 other tests pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][318] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][320] ([Intel XE#301]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][322] ([Intel XE#2955]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#656]) -> [PASS][325] +3 other tests pass
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#4328]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-dg2-set2:     [DMESG-WARN][328] -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_plane_lowres@tiling-none.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [DMESG-WARN][330] ([Intel XE#2953]) -> [PASS][331]
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_rpm@legacy-planes.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-adlp:         [DMESG-WARN][332] -> [PASS][333]
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [INCOMPLETE][334] ([Intel XE#1169]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [SKIP][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361]) ([Intel XE#378]) -> ([PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-2/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][387], [PASS][388], [SKIP][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409], [PASS][410], [PASS][411], [PASS][412]) ([Intel XE#378]) -> ([PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [PASS][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435], [PASS][436], [PASS][437])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][438], [PASS][439], [PASS][440], [PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [SKIP][461], [PASS][462], [PASS][463]) ([Intel XE#378]) -> ([PASS][464], [PASS][465], [PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [PASS][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][489] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][490] +3 other tests pass
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-adlp:         [DMESG-WARN][491] ([Intel XE#4173]) -> [PASS][492] +1 other test pass
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_wedged@wedged-at-any-timeout.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-lnl:          [SKIP][493] ([Intel XE#3279]) -> [INCOMPLETE][494] ([Intel XE#4245])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][495] ([Intel XE#1874]) -> [DMESG-FAIL][496] ([Intel XE#1033])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#787]) -> [SKIP][498] ([Intel XE#455] / [Intel XE#787]) +14 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][499] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][500] ([Intel XE#787]) +7 other tests skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][501] ([Intel XE#1178]) -> [SKIP][502] ([Intel XE#455])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_content_protection@atomic.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#455]) -> [FAIL][504] ([Intel XE#1178])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][505] ([Intel XE#455]) -> [FAIL][506] ([Intel XE#1188])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_content_protection@uevent.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_content_protection@uevent.html
    - shard-lnl:          [SKIP][507] ([Intel XE#3278]) -> [INCOMPLETE][508] ([Intel XE#2715]) +6 other tests incomplete
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_content_protection@uevent.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-dg2-set2:     [DMESG-WARN][509] ([Intel XE#1033]) -> [SKIP][510] ([Intel XE#309])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][511] ([Intel XE#656]) -> [SKIP][512] ([Intel XE#651]) +10 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][513] ([Intel XE#651]) -> [SKIP][514] ([Intel XE#656]) +9 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#653]) -> [SKIP][516] ([Intel XE#656]) +16 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][517] ([Intel XE#656]) -> [SKIP][518] ([Intel XE#653]) +9 other tests skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [DMESG-WARN][519] ([Intel XE#1033]) -> [SKIP][520] ([Intel XE#836])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_pm_rpm@modeset-non-lpsp.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][521] ([Intel XE#1729]) -> [SKIP][522] ([Intel XE#362])
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [ABORT][523] ([Intel XE#4268]) -> [ABORT][524] ([Intel XE#1033] / [Intel XE#4268])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@s4-basic.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [ABORT][525] ([Intel XE#1033] / [Intel XE#4268]) -> [ABORT][526] ([Intel XE#4268])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_pm@s4-basic-exec.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2550]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2550
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3549]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3549
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3719]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215
  [Intel XE#4243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4243
  [Intel XE#4245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245
  [Intel XE#4258]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4258
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8232 -> IGT_8233
  * Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -> xe-pw-144103v4

  IGT_8232: 8232
  IGT_8233: 2ccc769a09071702a620a6e9deb0c50120c62ebb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d9f67631e322bdd2a5
  xe-pw-144103v4: 144103v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/index.html

--===============7987293775301395875==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Allow display PHYs to rese=
t power state (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144103/">https://patchwork.freedesktop.org/series/144103/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144103v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144103v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2674-297dc497ff4e957b8a82d4d9f67631e32=
2bdd2a5_full -&gt; xe-pw-144103v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144103v4_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144103v4_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1441=
03v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@modeset=
-transition-nonblocking-fencing.html">INCOMPLETE</a> +2 other tests incompl=
ete</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_fb_c=
oherency@memset-crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_fb_coherency@memset-c=
rc.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sh=
ard-dg2-434/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interrup=
tible.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_plane_multiple@tiling-x=
.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_pm_b=
acklight@basic-brightness.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_pm_backlight@ba=
sic-brightness.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_psr@=
fbc-psr2-cursor-render@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_psr@fbc-psr2=
-cursor-render@edp-1.html">FAIL</a> +581 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_scal=
ing_modes@scaling-mode-center@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@km=
s_scaling_modes@scaling-mode-center@pipe-a-edp-1.html">SKIP</a> +51 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_vblank@query-forked.html"=
>FAIL</a> +127 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_sriov_scheduling@nonpree=
mpt-engine-resets.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719">Intel XE#3719</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Inte=
l XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144103v4/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-atomic.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144103v4/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-event=
s@pipe-a-edp-1-linear.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_asyn=
c_flips@test-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_async_fli=
ps@test-cursor.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4=
/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.ht=
ml">FAIL</a> +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile=
-to-16bpp-4tile-downscaling.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1397">Intel XE#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp=
-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">FAIL</a> +4 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_pm_d=
c@deep-pkgc.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_pm_dc@deep-pkgc=
.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_psr2=
_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sha=
rd-lnl-6/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP=
</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-l=
nl-3/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">FAIL</a> +16=
 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_psr@=
psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@km=
s_psr@psr2-primary-page-flip@edp-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-ln=
l-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">FAIL</a> +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sha=
rd-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bd=
d2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e3=
22bdd2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f676=
31e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82=
d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b=
8a82d4d9f67631e322bdd2a5/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e=
957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497=
ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297d=
c497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-=
297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-1/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4=
/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load=
.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bm=
g-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@l=
oad.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard=
-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_loa=
d@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sh=
ard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_=
load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WA=
RN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4=
/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG=
-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14410=
3v4/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_m=
odule_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.html">DM=
ESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4103v4/shard-bmg-1/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@x=
e_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-5/igt@xe_module_load@load.html"=
>DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144103v4/shard-bmg-5/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/ig=
t@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144103v4/shard-bmg-1/igt@xe_module_load@load.ht=
ml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144103v4/shard-bmg-4/igt@xe_module_load@load.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_pm@d3=
cold-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/ig=
t@xe_pm@d3cold-multiple-execs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_pm@=
s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144103v4_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-=
a-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-1-y.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-ato=
mic@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dme=
sg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-dp-4-4-mc-cc=
s:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_async_flips@async-flip-=
with-page-flip-events@pipe-d-dp-4-4-mc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2550">Intel XE#2550</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE=
#3767</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_atomic@atomic-plane-damag=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4245">Intel XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_atom=
ic_transition@modeset-transition.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_atomic_t=
ransition@modeset-transition.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4258">Intel XE#4258</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outp=
uts:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@modeset=
-transition-nonblocking-fencing@1x-outputs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4258">Intel XE#4258</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pip=
e-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_atom=
ic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-edp-1.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144103v4/shard-lnl-8/igt@kms_atomic_transition@plane-use-after-nonblocking-=
unbind-fencing@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4215">Intel XE#4215</a>) +20 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rota=
te-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1033">Intel XE#1033</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_bw@connected-linear-til=
ing-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_bw@l=
inear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_bw@lin=
ear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_bw@linear-tiling-1-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_bw@linear-tiling-1-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +25 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_ccs@bad-rotation-90-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-y=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_ccs@crc-primary-suspend=
-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +82 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cdclk@mode-transition@pi=
pe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/314">Intel XE#314</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_chamelium_color@ctm-nega=
tive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-s=
torm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/373">Intel XE#373</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_content_protection@lega=
cy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1178">Intel XE#1178</a>) +1 other test fail</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_content_protection@legacy=
.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_crc@cursor-onscr=
een-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_curs=
or_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_crc@c=
ursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cu=
rsor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@k=
ms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_cursor_legacy@2x-long-f=
lip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_dit=
her@fb-8bpc-vs-panel-6bpc@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_dp=
_aux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#=
3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fl=
ip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_=
flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_flip@2x-blocking-absolu=
te-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_flip@2x-flip-vs-rmfb-inte=
rruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_flip@2x-plain-flip-ts-ch=
eck-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_flip=
@blocking-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_flip@blockin=
g-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3549">Intel XE#3549</a>) +90 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_flip@busy-flip.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>) +39 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_flip@busy-flip@d-dp4.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1033">Intel XE#1033</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-=
modeset-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3549">Intel XE#3549</a>) +2 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_flip@flip-vs-dpms-off-vs-=
modeset-interruptible@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3549">Intel XE#3549</a>) +16 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_flip=
@flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip@flip-vs-mod=
eset-vs-hang.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3549">Intel XE#3549</a>) +9 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_flip@flip-vs-rm=
fb@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3868">Intel XE#3868</a>) +1 other test dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-int=
erruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@flip-vs-suspend-in=
terruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@kms_fli=
p@plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_f=
lip@plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@kms_fli=
p@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3=
/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel=
 XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shar=
d-lnl-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3549">Intel XE#3549</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3650">Intel XE#3650</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1=
401</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +11 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drr=
s-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-ad=
lp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +28 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_getfb@getfb2-accept-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1339">Intel XE#1339</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_hdr@static-toggle-dpms.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1503">Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@kms_leas=
e@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_lease@setcrtc-im=
plicit-plane.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4243">Intel XE#4243</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_plane@pixel-format-source=
-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_plane@pixel-format-sourc=
e-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@kms_plane@pixel-format-sourc=
e-clamping@pipe-a-plane-0.html">WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2078">Intel XE#2078</a>) +1 other test warn</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_plan=
e@plane-panning-bottom-right.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_plane@plane-=
panning-bottom-right.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@=
kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/599">Intel XE#599</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) +2 other tests=
 dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@kms_plane_scaling@plane-upsca=
le-20x20-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sha=
rd-lnl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763">Intel XE#2763</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_pm_backlight@fade-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_pm_dc@dc3co-vpb-simulat=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1122">Intel XE#1122</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulatio=
n.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_pm_rpm@dpms-mode-=
unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_pm_rpm@modeset-non-lpsp=
-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_pm_rpm@modeset-stress-ext=
ra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor=
-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-=
plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-4/igt@kms_psr@=
fbc-psr2-primary-blt.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_psr@fbc-psr2-primary=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@kms_psr@psr2-sprite-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_rotation_crc@sprite-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@kms_scal=
ing_modes@scaling-mode-full-aspect.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@kms_scalin=
g_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_se=
tmode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_setmode=
@invalid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">I=
ntel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel =
XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_writeback@writeback-pix=
el-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@kms_writeback@writeback-pixel=
-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@kms_writeback@writeback-pixe=
l-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_ccs@block-multicopy-inpla=
ce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_compute@ccs-mode-basic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1447">Intel XE#1447</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_copy_basic@mem-copy-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1123">Intel XE#1123</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_copy_basic@mem-set-linear=
-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_copy_basic@mem-set-linea=
r-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufe=
nce-reconnect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3889">Intel XE#3889</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_eudebug_online@debugger-=
reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@reset-with-attention:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_eudebug_online@reset-with=
-attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_eudebug_online@reset-with-=
attention.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2905">Intel XE#2905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_evict@evict-beng-small.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_evict@evict-beng-small.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_evict_ccs@evict-overcommi=
t-parallel-instantfree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_exec_basic@multigpu-once-=
userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)=
 +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_exec_reset@cat-error.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sh=
ard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_=
early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_media_fill@media-fill.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/560">Intel XE#560</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4045">Intel XE#4045</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4045">Intel XE#4045</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_oa@invalid-create-usersp=
ace-config.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_oa@rc6-disable.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-ex=
ec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_pm@s3-mocs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel =
XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_pm_re=
sidency@gt-c6-freeze.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_pm_residency@gt-c6-fr=
eeze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3088">Intel XE#3088</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_query@multigpu-query-inv=
alid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_query@multigpu-query-inva=
lid-query.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_query@multigpu-query-inval=
id-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4=
/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#103=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hfli=
p.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/s=
hard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel X=
E#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@kms_ccs@random-ccs=
-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-=
463/igt@kms_cursor_crc@cursor-onscreen-64x64.html">PASS</a> +45 other tests=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-d=
g2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_fb=
con_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms=
_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/=
igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> +3 other tests pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
321">Intel XE#3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144103v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank=
-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144103v4/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible=
@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_fl=
ip@2x-flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg=
2-433/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrf=
b-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_jo=
iner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@k=
ms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_pl=
ane_lowres@tiling-none.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_plane_lowr=
es@tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_=
rpm@legacy-planes.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_pm=
_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-6/igt@kms_pm_=
rpm@legacy-planes@plane-50.html">DMESG-WARN</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@kms_pm_rpm@=
legacy-planes@plane-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
03v4/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-l=
nl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sha=
rd-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bd=
d2a5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e3=
22bdd2a5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f676=
31e322bdd2a5/shard-lnl-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82=
d4d9f67631e322bdd2a5/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b=
8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e=
957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497=
ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297d=
c497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-=
297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sh=
ard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a=
5/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144103v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144103v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-144103v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/=
igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sha=
rd-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a=
5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322=
bdd2a5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f6763=
1e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a8=
2d4d9f67631e322bdd2a5/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e95=
7b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497f=
f4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297d=
c497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674=
-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/sha=
rd-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a=
5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322=
bdd2a5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f6763=
1e322bdd2a5/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a8=
2d4d9f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e95=
7b8a82d4d9f67631e322bdd2a5/shard-adlp-9/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1441=
03v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-a=
dlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144103v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sh=
ard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144103v4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103=
v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-144103v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adl=
p-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44103v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-144103v4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shar=
d-adlp-3/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-4=
63/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard=
-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322=
bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f676=
31e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d=
4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957=
b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497f=
f4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297=
dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
74-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-d=
g2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/s=
hard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bd=
d2a5/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631=
e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a82d4d9=
f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e957b8a=
82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc497ff4e=
957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-297dc4=
97ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2674-=
297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_load@l=
oad.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-46=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4103v4/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144103v4/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44103v4/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-=
434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-434/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144103v4/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-d=
g2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> +3 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-4/igt@xe_wedg=
ed@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-adlp-3/i=
gt@xe_wedged@wedged-at-any-timeout.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-7/igt@kms_atom=
ic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl=
-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245">Intel =
XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/=
shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
103v4/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d=
-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_cc=
s@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel =
XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144103v4/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-h=
dmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@kms=
_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-433/igt@kms_con=
tent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-lnl-2/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-lnl-6/igt@kms_conte=
nt_protection@uevent.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +6 other tests inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-toggle.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard=
-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#30=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel=
 XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144103v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-=
cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel =
XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-s=
pr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44103v4/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/656">Intel XE#656</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel X=
E#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144103v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr=
-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-463/igt@kms_pm=
_rpm@modeset-non-lpsp.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-464/igt@k=
ms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-433/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-434/igt@xe_pm@=
s4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-463/igt@xe_pm@s4-basic.html=
">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5/shard-dg2-466/igt@xe_pm@=
s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v4/shard-dg2-466/igt@=
xe_pm@s4-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8232 -&gt; IGT_8233</li>
<li>Linux: xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5 -&gt; xe-pw-144=
103v4</li>
</ul>
<p>IGT_8232: 8232<br />
  IGT_8233: 2ccc769a09071702a620a6e9deb0c50120c62ebb @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2674-297dc497ff4e957b8a82d4d9f67631e322bdd2a5: 297dc497ff4e957b8a82d4d=
9f67631e322bdd2a5<br />
  xe-pw-144103v4: 144103v4</p>

</body>
</html>

--===============7987293775301395875==--
