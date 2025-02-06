Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91A0C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 21:16:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1CC10E957;
	Thu,  6 Feb 2025 21:16:38 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3985910E957;
 Thu,  6 Feb 2025 21:16:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4984976787388985062=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dp=5Fmst=3A_Fix_d?=
 =?utf-8?q?isabling_the_minimum_HBlank_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 21:16:24 -0000
Message-ID: <173887658421.2248575.2124595394991156255@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206164624.3185280-1-imre.deak@intel.com>
In-Reply-To: <20250206164624.3185280-1-imre.deak@intel.com>
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

--===============4984976787388985062==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp_mst: Fix disabling the minimum HBlank time
URL   : https://patchwork.freedesktop.org/series/144431/
State : failure

== Summary ==

CI Bug Log - changes from xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e_full -> xe-pw-144431v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144431v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144431v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144431v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-offscreen-256x256:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-256x256.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-256x256.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@reload.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@reload.html

  
Known issues
------------

  Here are the changes found in xe-pw-144431v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [PASS][5] -> [SKIP][6] ([Intel XE#2134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@fbdev@nullptr.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@nullptr.html

  * igt@fbdev@unaligned-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#2134])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@unaligned-read.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#4208] / [i915#2575]) +106 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_atomic@plane-invalid-params-fence.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][10] ([Intel XE#4172]) +3 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][13] -> [INCOMPLETE][14] ([Intel XE#3862]) +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#787]) +48 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] ([Intel XE#4010]) +1 other test incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#314]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#3304])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [PASS][20] -> [SKIP][21] ([Intel XE#2291]) +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][22] -> [DMESG-WARN][23] ([Intel XE#877]) +1 other test dmesg-warn
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2316]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][26] -> [FAIL][27] ([Intel XE#301]) +9 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][28] -> [FAIL][29] ([Intel XE#3321]) +4 other tests fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][32] -> [INCOMPLETE][33] ([Intel XE#2049] / [Intel XE#2597]) +2 other tests incomplete
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#2351] / [Intel XE#4208]) +17 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#2351] / [Intel XE#4208]) +28 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#4208] / [i915#2575]) +64 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#2566] / [Intel XE#877])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_plane@pixel-format-source-clamping.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#4172]) +23 other tests dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2763]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2763] / [Intel XE#455])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#1435])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_setmode@clone-exclusive-crtc.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4208]) +195 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [PASS][48] -> [SKIP][49] ([Intel XE#4208]) +232 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][50] ([Intel XE#1033]) +12 other tests dmesg-warn
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-adlp:         [PASS][51] -> [DMESG-WARN][52] ([Intel XE#4173]) +1 other test dmesg-warn
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2229] / [Intel XE#455])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#2229])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#1192])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@xe_live_ktest@xe_migrate.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81]) -> ([PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [SKIP][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107]) ([Intel XE#378])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][108] ([Intel XE#1173])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#1061] / [Intel XE#4208])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_peer2peer@write.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][110] -> [PASS][111] +1 other test pass
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@core_getversion@all-cards.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@core_getversion@all-cards.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][112] ([Intel XE#3908]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][114] ([Intel XE#1033]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][116] ([Intel XE#2291]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][118] ([Intel XE#1475]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][120] ([Intel XE#1340]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-bmg:          [SKIP][122] ([Intel XE#2316]) -> [PASS][123] +2 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][124] ([Intel XE#2882]) -> [PASS][125] +5 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
    - shard-dg2-set2:     [FAIL][126] ([Intel XE#886]) -> [PASS][127] +2 other tests pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#4208] / [i915#2575]) -> [PASS][129] +44 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_flip@busy-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip@busy-flip.html

  * igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:
    - shard-lnl:          [FAIL][130] ([Intel XE#3098]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][132] ([Intel XE#3321]) -> [PASS][133] +5 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][136] ([Intel XE#886]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-lnl-4/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [FAIL][138] ([Intel XE#886]) -> [PASS][139] +1 other test pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-6/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#4208]) -> [PASS][141] +113 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][143] +3 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][144] ([Intel XE#4173]) -> [PASS][145] +3 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-3/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [DMESG-WARN][146] ([Intel XE#4172]) -> [PASS][147] +6 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-adlp:         [DMESG-WARN][148] -> [PASS][149] +4 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [SKIP][150] ([Intel XE#1192]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html

  
#### Warnings ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [DMESG-WARN][152] ([Intel XE#1033]) -> [SKIP][153] ([Intel XE#2134])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@fbdev@write.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@write.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#316]) -> [SKIP][155] ([Intel XE#2351] / [Intel XE#4208])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#316]) -> [SKIP][157] ([Intel XE#4208]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][159] ([Intel XE#316])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][160] ([Intel XE#1033]) -> [SKIP][161] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][162] ([Intel XE#4208]) -> [SKIP][163] ([Intel XE#316])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#610]) -> [SKIP][165] ([Intel XE#4208]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#4208]) -> [SKIP][167] ([Intel XE#1124]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#1124]) -> [SKIP][169] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][171] ([Intel XE#1124]) +4 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#619]) -> [SKIP][173] ([Intel XE#2351] / [Intel XE#4208])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#607]) -> [SKIP][175] ([Intel XE#4208])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1124]) -> [SKIP][177] ([Intel XE#4208]) +5 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#2191]) -> [SKIP][179] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#4208] / [i915#2575]) -> [SKIP][181] ([Intel XE#2191]) +1 other test skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#367]) -> [SKIP][183] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#4208] / [i915#2575]) -> [SKIP][185] ([Intel XE#367])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][187] ([Intel XE#4208]) +10 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][188] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][189] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#4208]) -> [SKIP][191] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][193] ([Intel XE#455] / [Intel XE#787])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#306]) -> [SKIP][195] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#4208] / [i915#2575]) -> [SKIP][197] ([Intel XE#306]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_chamelium_color@gamma.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#4208] / [i915#2575]) -> [SKIP][199] ([Intel XE#373]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#373]) -> [SKIP][201] ([Intel XE#4208] / [i915#2575]) +17 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][202] ([Intel XE#1178]) -> [SKIP][203] ([Intel XE#4208] / [i915#2575])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_content_protection@atomic.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#4208] / [i915#2575]) -> [SKIP][205] ([Intel XE#455]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_content_protection@content-type-change.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#4208] / [i915#2575]) -> [FAIL][207] ([Intel XE#1178])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][208] ([Intel XE#1178]) -> [SKIP][209] ([Intel XE#2341])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_content_protection@srm.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#4208] / [i915#2575]) -> [SKIP][211] ([Intel XE#308]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208] / [i915#2575]) -> [DMESG-WARN][213] ([Intel XE#1033]) +8 other tests dmesg-warn
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#308]) -> [SKIP][215] ([Intel XE#4208] / [i915#2575])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x512.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#323]) -> [SKIP][217] ([Intel XE#4208] / [i915#2575])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208] / [i915#2575]) -> [SKIP][219] ([Intel XE#323])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#4208] / [i915#2575]) -> [INCOMPLETE][221] ([Intel XE#3226])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][222] ([Intel XE#877]) -> [SKIP][223] ([Intel XE#2291])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#307]) -> [SKIP][225] ([Intel XE#4208] / [i915#2575])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_display_modes@mst-extended-mode-negative.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#776]) -> [SKIP][227] ([Intel XE#4208])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_fbcon_fbt@psr-suspend.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1135]) -> [SKIP][229] ([Intel XE#4208] / [i915#2575])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_feature_discovery@psr1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-FAIL][230] ([Intel XE#4172]) -> [DMESG-WARN][231] ([Intel XE#4172])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][232] ([Intel XE#4172]) -> [INCOMPLETE][233] ([Intel XE#2049] / [Intel XE#2597])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip@flip-vs-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][235] ([Intel XE#455])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#4208]) -> [SKIP][237] ([Intel XE#455]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#455]) -> [SKIP][239] ([Intel XE#4208]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#455]) -> [SKIP][241] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][242] ([Intel XE#2311]) -> [SKIP][243] ([Intel XE#2312]) +7 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][244] ([Intel XE#4141]) -> [SKIP][245] ([Intel XE#2312]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][246] ([Intel XE#2312]) -> [SKIP][247] ([Intel XE#4141]) +4 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#4208]) -> [DMESG-WARN][249] ([Intel XE#1033]) +7 other tests dmesg-warn
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#4208]) -> [SKIP][251] ([Intel XE#651]) +17 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][253] ([Intel XE#651]) +3 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#651]) -> [SKIP][255] ([Intel XE#4208]) +23 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][256] ([Intel XE#2312]) -> [SKIP][257] ([Intel XE#2311]) +6 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#651]) -> [SKIP][259] ([Intel XE#2351] / [Intel XE#4208]) +16 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#658]) -> [SKIP][261] ([Intel XE#2351] / [Intel XE#4208])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][262] ([Intel XE#2313]) -> [SKIP][263] ([Intel XE#2312]) +6 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#653]) -> [SKIP][265] ([Intel XE#4208]) +24 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][267] ([Intel XE#653]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#4208]) -> [SKIP][269] ([Intel XE#1158])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#653]) -> [SKIP][271] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#4208]) -> [SKIP][273] ([Intel XE#653]) +14 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][274] ([Intel XE#2312]) -> [SKIP][275] ([Intel XE#2313]) +6 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][276] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][277] ([Intel XE#3544])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#346]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#2925]) -> [SKIP][281] ([Intel XE#4208])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [DMESG-WARN][282] ([Intel XE#4212]) -> [SKIP][283] ([Intel XE#4208] / [i915#2575])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208] / [i915#2575]) -> [SKIP][285] ([Intel XE#2763] / [Intel XE#455])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4208]) -> [SKIP][287] ([Intel XE#870])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_pm_backlight@fade-with-dpms.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][289] ([Intel XE#1122])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1129]) -> [SKIP][291] ([Intel XE#2351] / [Intel XE#4208])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][292] ([Intel XE#734]) -> [FAIL][293] ([Intel XE#3325])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#4208]) -> [SKIP][295] ([Intel XE#1489]) +3 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1489]) -> [SKIP][297] ([Intel XE#4208]) +13 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][299] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#4208]) -> [SKIP][301] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_psr@pr-sprite-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@pr-sprite-render:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][303] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_psr@pr-sprite-render.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_psr@pr-sprite-render.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][305] ([Intel XE#4208]) +13 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_psr@psr2-basic.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#1127]) -> [SKIP][307] ([Intel XE#4208] / [i915#2575])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#3414]) -> [SKIP][309] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#4208] / [i915#2575]) -> [SKIP][311] ([Intel XE#3414])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#4208] / [i915#2575]) -> [FAIL][313] ([Intel XE#1729])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1500]) -> [SKIP][315] ([Intel XE#4208] / [i915#2575])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-busy-hang:
    - shard-dg2-set2:     [DMESG-WARN][316] ([Intel XE#1033]) -> [SKIP][317] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_vblank@query-busy-hang.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_vblank@query-busy-hang.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#455]) -> [SKIP][319] ([Intel XE#4208] / [i915#2575]) +9 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#4208] / [i915#2575]) -> [SKIP][321] ([Intel XE#2168])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_vrr@lobf.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#756]) -> [SKIP][323] ([Intel XE#4208] / [i915#2575])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#4208] / [i915#2575]) -> [SKIP][325] ([Intel XE#1091] / [Intel XE#2849])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][326] ([Intel XE#2705] / [Intel XE#4212]) -> [SKIP][327] ([Intel XE#4208])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@testdisplay.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][329] ([Intel XE#4208]) +1 other test skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#4208]) -> [SKIP][331] ([Intel XE#1126])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1126]) -> [SKIP][333] ([Intel XE#4208]) +1 other test skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2905]) -> [SKIP][335] ([Intel XE#4208]) +18 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind-extended-discovery:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [SKIP][337] ([Intel XE#2905]) +8 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-extended-discovery.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#4208]) -> [SKIP][339] ([Intel XE#3889]) +1 other test skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#3889]) -> [SKIP][341] ([Intel XE#4208])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-bmg:          [DMESG-WARN][342] ([Intel XE#4172]) -> [DMESG-WARN][343] ([Intel XE#1473] / [Intel XE#4172])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@xe_evict@evict-beng-small-multi-vm.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [DMESG-WARN][344] ([Intel XE#1033]) -> [SKIP][345] ([Intel XE#4208]) +9 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#4208]) -> [SKIP][347] ([Intel XE#288]) +16 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#288]) -> [SKIP][349] ([Intel XE#4208]) +33 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2360]) -> [SKIP][351] ([Intel XE#4208]) +1 other test skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1192]) -> [SKIP][353] ([Intel XE#2229] / [Intel XE#455])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
    - shard-bmg:          [DMESG-WARN][354] ([Intel XE#4172]) -> [SKIP][355] ([Intel XE#1192])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][356] ([Intel XE#1192]) -> [SKIP][357] ([Intel XE#2833])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208]) -> [SKIP][359] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][361] ([Intel XE#4208]) +9 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_oa@whitelisted-registers-userspace-config.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][363] ([Intel XE#1173])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_peer2peer@read.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][365] ([Intel XE#4208])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_pm@d3cold-basic.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208]) -> [SKIP][367] ([Intel XE#2284] / [Intel XE#366])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][368] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][369] ([Intel XE#4208])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@s3-basic-exec.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208]) -> [DMESG-WARN][371] ([Intel XE#1033] / [Intel XE#569])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@s3-vm-bind-userptr.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][372] ([Intel XE#1358]) -> [SKIP][373] ([Intel XE#4208]) +1 other test skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-dg2-set2:     [ABORT][374] ([Intel XE#1033] / [Intel XE#1358]) -> [SKIP][375] ([Intel XE#4208]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@s4-mocs.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#4208]) -> [ABORT][377] ([Intel XE#1358]) +1 other test abort
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@s4-vm-bind-userptr.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#4208]) -> [SKIP][379] ([Intel XE#944])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_query@multigpu-query-gt-list.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#944]) -> [SKIP][381] ([Intel XE#4208])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_query@multigpu-query-topology.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#4130]) -> [SKIP][383] ([Intel XE#4208]) +1 other test skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#3342]) -> [SKIP][385] ([Intel XE#4208])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#4208]) -> [SKIP][387] ([Intel XE#3342])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4010
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e -> xe-pw-144431v1

  IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e: 68225b9bc1d285bd2ab63355e94f9e661d2f895e
  xe-pw-144431v1: 144431v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/index.html

--===============4984976787388985062==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp_mst: Fix disabling the minimum H=
Blank time</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/144431/">https://patchwork.freedesktop.org/series/144431/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144431v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144431v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2611-68225b9bc1d285bd2ab63355e94f9e661=
d2f895e_full -&gt; xe-pw-144431v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144431v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-144431v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1444=
31v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x256:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_cur=
sor_crc@cursor-offscreen-256x256.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-8/igt@kms_cursor_=
crc@cursor-offscreen-256x256.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@reload.html"=
>FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144431v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@fbdev@=
nullptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@nullptr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#21=
34</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@unaligned-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
34">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_at=
omic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_atomic@=
plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +106 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_atomic_interruptible@lega=
cy-setmode@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dm=
esg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-5/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 ot=
her test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-=
yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4010">Intel XE#4010</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_fl=
ip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt=
@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-7/igt@kms=
_flip@2x-flip-vs-expired-vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@kms_flip@fl=
ip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-7/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sha=
rd-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling@p=
ipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@dr=
rs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +28 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_hdr@invalid-hdr.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/k=
ernel/-/issues/2575">i915#2575</a>) +64 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_plan=
e@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_plane@pixe=
l-format-source-clamping.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +23=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_balancer@once-paral=
lel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +195 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exe=
c_basic@many-null-rebind.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_exec_basic@many=
-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) +232 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@sanity-after-timeout@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_exec_sip@sanity-after-ti=
meout@drm_xe_engine_class_render0.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +12 ot=
her tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@xe_faul=
t_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp=
-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_e=
vict_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_=
migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@xe_live_=
ktest@xe_migrate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@xe_live_ktest@xe_migrate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d=
2f895e/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f=
9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63=
355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285b=
d2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc=
1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-682=
25b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
11-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f=
895e/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355e94f9e=
661d2f895e/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2ab63355=
e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d285bd2a=
b63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b9bc1d2=
85bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-68225b=
9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2611-=
68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44431v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144431v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2=
-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144431v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_peer2peer@read@read-gpua=
-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_peer2peer@write.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061=
">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@core_g=
etversion@all-cards.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@core_getversion@all-car=
ds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/=
shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-8/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144431v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate=
-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-b=
mg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@kms_di=
ther@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-panning.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-5/igt@kms_flip@2x=
-flip-vs-panning.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-1/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +5 other tests pass</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_fl=
ip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-466/igt@km=
s_flip@2x-plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fl=
ip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@km=
s_flip@busy-flip.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-lnl-1/igt@kms_flip=
@dpms-vs-vblank-race-interruptible@a-edp1.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard=
-lnl-1/igt@kms_flip@dpms-vs-vblank-race-interruptible@a-edp1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sha=
rd-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS=
</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-lnl-4/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-lnl-5/igt@km=
s_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-6/igt@kms_fli=
p@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-2/igt@k=
ms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">PASS</a> +113 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-xti=
le-to-16bpp-xtile-upscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-3/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sha=
rd-adlp-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +=
3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-1/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel X=
E#4172</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-75-wi=
th-rotation.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-6/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">DMESG-WAR=
N</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-ro=
tation@pipe-a.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@xe_live_=
ktest@xe_mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-4/igt@xe_live_ktest@xe_=
mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@fbdev@=
write.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@fbdev@write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@k=
ms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@km=
s_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard=
-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_bi=
g_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-46=
4/igt@kms_big_fb@linear-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt=
@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44431v1/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180=
-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
431v1/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg=
2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144431v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144431v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-2=
160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_bw=
@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-46=
4/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_bw=
@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-dg2-435/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431=
v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431=
v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-=
dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1=
/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_ch=
amelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435=
/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ch=
amelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2=
-435/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_chameli=
um_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_co=
ntent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-dg2-435/igt@kms_content_protection@content-type-change.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard=
-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1=
/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-64x64.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel =
XE#1033</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@=
kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/=
shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-144431v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursora-vs-flipa-atomic-transitions.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575"=
>i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-144431v1/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-=
transitions.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3226">Intel XE#3226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg=
-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_di=
splay_modes@mst-extended-mode-negative.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-=
464/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_fb=
con_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_fbcon_f=
bt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@kms_flip=
@2x-wf_vblank-ts-check.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@km=
s_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_flip=
@flip-vs-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-8/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-144431v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32=
bpp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144431v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#41=
41</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v=
1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/s=
hard-dg2-435/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1033">Intel XE#1033</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-p=
ri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb=
-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-144431v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v=
1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
144431v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-6/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt=
@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-d=
g2-464/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-=
464/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
44431v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_pm=
_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms=
_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg=
2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_pm_dc@dc6-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-adlp-2/igt@kms_pm_=
dc@dc9-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/734">Intel XE#734</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144431v1/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3325">Intel XE#3325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-144431v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continu=
ous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel=
 XE#1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-144431v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shar=
d-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Int=
el XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ps=
r@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_psr@pr-sp=
rite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@kms_ps=
r@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/=
igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_=
psr@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg=
2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-=
dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ro=
tation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
4431v1/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_ti=
led_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#172=
9</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_vb=
lank@query-busy-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@km=
s_vblank@query-busy-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +12 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-46=
4/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@sriov_=
basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/sh=
ard-dg2-436/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#109=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849=
">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@testdi=
splay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@tes=
tdisplay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-=
dg2-464/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2=
-435/igt@xe_eudebug@basic-vm-bind-extended-discovery.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#290=
5</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-4=
35/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_eud=
ebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-d=
g2-464/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@xe_evict=
@evict-beng-small-multi-vm.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/ig=
t@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE=
#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exe=
c_compute_mode@twice-userptr-invalidate-race.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1444=
31v1/shard-dg2-464/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shar=
d-dg2-435/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-4=
64/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-435/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg=
2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_liv=
e_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_live_ktest@x=
e_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-5/igt@xe_live_=
ktest@xe_bo.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-2/igt@xe_live_ktest=
@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-bmg-2/igt@xe_live_=
ktest@xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-bmg-8/igt@xe_live_ktest@=
xe_eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-43=
5/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_oa@=
whitelisted-registers-userspace-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#357=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144=
431v1/shard-dg2-464/igt@xe_oa@whitelisted-registers-userspace-config.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pee=
r2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_=
peer2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_p=
m@d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@=
s3-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/=
igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@=
s3-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_pm@s3-v=
m-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@=
s4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@s4=
-d3hot-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_pm@=
s4-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_pm@=
s4-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_pm@=
s4-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_pm@s4-v=
m-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1358">Intel XE#1358</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_que=
ry@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-436/igt@xe_=
query@multigpu-query-gt-list.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-436/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_q=
uery@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-144431v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-466/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-464/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e/shard-dg2-464/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144431v1/shard-dg2-435/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e -&gt; xe-pw-144=
431v1</li>
</ul>
<p>IGT_8224: c659b986ba648584d36b3cfece897bc84a33dcbb @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2611-68225b9bc1d285bd2ab63355e94f9e661d2f895e: 68225b9bc1d285bd2ab6335=
5e94f9e661d2f895e<br />
  xe-pw-144431v1: 144431v1</p>

</body>
</html>

--===============4984976787388985062==--
