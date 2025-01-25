Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7504EC02182
	for <intel-xe@archiver.kernel.org>; Sat, 25 Jan 2025 06:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB12610E230;
	Sat, 25 Jan 2025 06:12:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0010E230;
 Sat, 25 Jan 2025 06:12:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4951604371205772747=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/dmc=3A_Test_Xe2LP?=
 =?utf-8?q?D_DMC_v2=2E27_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 25 Jan 2025 06:12:55 -0000
Message-ID: <173778557591.207397.6006044063387792662@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250124195752.62014-1-gustavo.sousa@intel.com>
In-Reply-To: <20250124195752.62014-1-gustavo.sousa@intel.com>
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

--===============4951604371205772747==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Test Xe2LPD DMC v2.27 (rev2)
URL   : https://patchwork.freedesktop.org/series/142981/
State : failure

== Summary ==

CI Bug Log - changes from xe-2550-df181b47c540b5c4604c91929f4f346030955d53_full -> xe-pw-142981v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142981v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142981v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142981v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:
    - shard-bmg:          [PASS][2] -> [INCOMPLETE][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@xe_exec_balancer@many-execqueues-cm-virtual-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-adlp:         [PASS][4] -> [DMESG-WARN][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html

  
Known issues
------------

  Here are the changes found in xe-pw-142981v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#3453])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][13] -> [SKIP][14] ([Intel XE#2134])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@fbdev@info.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@fbdev@info.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#2136]) +37 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2136] / [Intel XE#2351]) +9 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1124]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1124]) +4 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#787]) +202 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#2907])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][26] -> [DMESG-WARN][27] ([Intel XE#1033]) +7 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#455] / [Intel XE#787]) +34 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#314]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#306])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#373]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#307])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#1178])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#308]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2423] / [i915#2575]) +125 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#323])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#877]) +3 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-2/igt@kms_display_modes@extended-mode-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#301] / [Intel XE#3321])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][42] ([Intel XE#301]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3321]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][47] ([Intel XE#2049] / [Intel XE#2597])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#2953]) +2 other tests dmesg-warn
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-2/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          [PASS][50] -> [INCOMPLETE][51] ([Intel XE#2049]) +1 other test incomplete
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@c-dp2:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#2882])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip@plain-flip-ts-check@c-dp2.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@plain-flip-ts-check@c-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#455]) +9 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][55] -> [DMESG-FAIL][56] ([Intel XE#1033])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][57] -> [FAIL][58] ([Intel XE#1874]) +1 other test fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#651]) +10 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#656])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#653]) +13 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2313])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2927])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#346])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#356])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#2763]) +11 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#870])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#3309])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@i2c:
    - shard-dg2-set2:     [PASS][71] -> [SKIP][72] ([Intel XE#2446]) +4 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm_rpm@i2c.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_rpm@i2c.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1489]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#1489])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#1127])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#3414]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][79] ([Intel XE#1033]) +4 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][80] -> [FAIL][81] ([Intel XE#2883]) +2 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#756])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [ABORT][83] ([Intel XE#2625])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#3889])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters-userptr.html

  * igt@xe_eudebug_online@resume-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2905]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_eudebug_online@resume-one.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][87] -> [SKIP][88] ([Intel XE#1130]) +210 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#1392]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#1392])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#288]) +10 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-dg2-set2:     [PASS][93] -> [ABORT][94] ([Intel XE#2625])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_gt_freq@freq_suspend.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#1192])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120]) -> ([PASS][121], [PASS][122], [PASS][123], [PASS][124], [SKIP][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146]) ([Intel XE#378])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_module_load@load.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_pat@pat-index-xelp:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#977])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@xe_pat@pat-index-xelp.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#1173]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#2284] / [Intel XE#366])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [PASS][151] -> [DMESG-WARN][152] ([Intel XE#1033] / [Intel XE#569])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html
    - shard-dg2-set2:     [PASS][153] -> [DMESG-WARN][154] ([Intel XE#1033] / [Intel XE#569])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [PASS][155] -> [DMESG-WARN][156] ([Intel XE#1033] / [Intel XE#2280])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-4/igt@xe_pm@s4-mocs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-3/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][157] ([Intel XE#1033] / [Intel XE#2280])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-bmg:          [PASS][158] -> [DMESG-WARN][159] ([Intel XE#1033]) +12 other tests dmesg-warn
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-4/igt@xe_pm_residency@cpg-basic.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-3/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_pm_residency@idle-residency-on-exec:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][160] ([Intel XE#1033])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec.html

  * igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][161] ([Intel XE#1033]) +33 other tests dmesg-warn
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_class_copy.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][162] ([Intel XE#944])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@core_setmaster_vs_auth:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#2423]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@core_setmaster_vs_auth.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@core_setmaster_vs_auth.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][165] ([Intel XE#827]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][167] ([Intel XE#3908]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][169] ([Intel XE#1033]) -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][171] ([Intel XE#877]) -> [PASS][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#1033]) -> [PASS][174] +2 other tests pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [ABORT][175] ([Intel XE#2625]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][177] ([Intel XE#2882]) -> [PASS][178] +2 other tests pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-8/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp4:
    - shard-dg2-set2:     [INCOMPLETE][179] ([Intel XE#2049]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp4.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          [FAIL][181] ([Intel XE#3321]) -> [PASS][182] +1 other test pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [DMESG-WARN][183] ([Intel XE#1033]) -> [PASS][184] +4 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-3/igt@kms_flip@flip-vs-panning-vs-hang.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-7/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#2953]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][187] ([Intel XE#886]) -> [PASS][188] +5 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][189] ([Intel XE#1874]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2351]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][194] +12 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2136]) -> [PASS][196] +24 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html

  * igt@kms_lease@lease-invalid-crtc:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#2423] / [i915#2575]) -> [PASS][198] +67 other tests pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_lease@lease-invalid-crtc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_lease@lease-invalid-crtc.html

  * igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:
    - shard-adlp:         [DMESG-WARN][199] -> [PASS][200] +8 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-3/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2446]) -> [PASS][202] +4 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][203] -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_setmode@basic@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][205] -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [ABORT][207] ([Intel XE#2625] / [Intel XE#4057]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1392]) -> [PASS][210] +3 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#2229] / [Intel XE#455]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#2229]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [ABORT][215] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_pm@s2idle-mocs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_pm@s2idle-mocs.html

  * igt@xe_vm@mmap-style-bind-userptr-one-partial:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1130]) -> [PASS][218] +157 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_vm@mmap-style-bind-userptr-one-partial.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_vm@mmap-style-bind-userptr-one-partial.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#3768]) -> [SKIP][220] ([Intel XE#2423] / [i915#2575])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_async_flips@invalid-async-flip-atomic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][222] ([Intel XE#316]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#316]) -> [SKIP][224] ([Intel XE#2136] / [Intel XE#2351])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#2136]) -> [SKIP][226] ([Intel XE#316]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#316]) -> [SKIP][228] ([Intel XE#2136]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [DMESG-WARN][229] ([Intel XE#1033]) -> [SKIP][230] ([Intel XE#2136]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#619]) -> [SKIP][232] ([Intel XE#2136] / [Intel XE#2351])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][234] ([Intel XE#607])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#610]) -> [SKIP][236] ([Intel XE#2136])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1124]) -> [SKIP][238] ([Intel XE#2136]) +9 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1124]) -> [SKIP][240] ([Intel XE#2136] / [Intel XE#2351])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#2136]) -> [SKIP][242] ([Intel XE#1124]) +10 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#607]) -> [SKIP][244] ([Intel XE#2136])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][246] ([Intel XE#1124]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#2191]) -> [SKIP][248] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2423] / [i915#2575]) -> [SKIP][250] ([Intel XE#367]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#367]) -> [SKIP][252] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][254] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][256] ([Intel XE#2136]) +17 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2907]) -> [SKIP][258] ([Intel XE#2136]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][260] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2423] / [i915#2575]) -> [SKIP][264] ([Intel XE#306]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_chamelium_color@ctm-limited-range.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#373]) +10 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#373]) -> [SKIP][268] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#2423] / [i915#2575]) -> [SKIP][270] ([Intel XE#307])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][271] ([Intel XE#1178]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_content_protection@legacy.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [FAIL][274] ([Intel XE#1178])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_content_protection@srm.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2423] / [i915#2575]) -> [SKIP][276] ([Intel XE#308]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2423] / [i915#2575]) -> [SKIP][278] ([Intel XE#455]) +7 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#323]) -> [SKIP][280] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2423] / [i915#2575]) -> [SKIP][282] ([Intel XE#323]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#455]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_dsc@dsc-with-formats.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#2136]) -> [SKIP][286] ([Intel XE#455]) +3 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#776]) -> [SKIP][288] ([Intel XE#2136])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_fbcon_fbt@psr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#703]) -> [SKIP][290] ([Intel XE#2423] / [i915#2575])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#2423] / [i915#2575]) -> [SKIP][292] ([Intel XE#1138])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1137]) -> [SKIP][294] ([Intel XE#2423] / [i915#2575])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [SKIP][296] ([Intel XE#1135])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#2423] / [i915#2575]) -> [FAIL][298] ([Intel XE#301])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][300] ([Intel XE#1033]) +10 other tests dmesg-warn
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_flip@busy-flip.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [INCOMPLETE][301] ([Intel XE#2049]) -> [DMESG-WARN][302] ([Intel XE#1033])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][303] ([Intel XE#1033]) -> [SKIP][304] ([Intel XE#2423] / [i915#2575])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [DMESG-WARN][305] -> [DMESG-WARN][306] ([Intel XE#1033])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2423] / [i915#2575]) -> [INCOMPLETE][308] ([Intel XE#2049] / [Intel XE#2597])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#455]) -> [SKIP][310] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#455]) -> [SKIP][312] ([Intel XE#2136]) +7 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#651]) -> [SKIP][314] ([Intel XE#2136]) +27 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#651]) -> [SKIP][316] ([Intel XE#2136] / [Intel XE#2351]) +12 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#2136]) -> [SKIP][318] ([Intel XE#651]) +24 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][320] ([Intel XE#651]) +9 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#653]) -> [SKIP][322] ([Intel XE#2136] / [Intel XE#2351]) +10 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#658])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][326] ([Intel XE#653]) +9 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#653]) -> [SKIP][328] ([Intel XE#2136]) +28 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#653]) +26 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#605]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#2925]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_joiner@basic-force-ultra-joiner.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2927]) -> [SKIP][336] ([Intel XE#2136])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [FAIL][337] ([Intel XE#616]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_plane_cursor@overlay.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#2423] / [i915#2575]) -> [SKIP][340] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][342] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2136]) -> [SKIP][344] ([Intel XE#870])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#870]) -> [SKIP][346] ([Intel XE#2136])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1129]) -> [SKIP][348] ([Intel XE#2136])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][350] ([Intel XE#908])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [DMESG-WARN][351] ([Intel XE#1033]) -> [SKIP][352] ([Intel XE#2446])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1489]) -> [SKIP][354] ([Intel XE#2136]) +9 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2136]) -> [SKIP][356] ([Intel XE#1489]) +10 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#1122]) -> [SKIP][358] ([Intel XE#2136])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][360] ([Intel XE#2136]) +13 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][362] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_psr@fbc-psr2-cursor-blt.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][366] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][368] ([Intel XE#2351])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_psr@psr-primary-page-flip.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2351]) -> [SKIP][370] ([Intel XE#2850] / [Intel XE#929])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][372] ([Intel XE#2939])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#3414]) -> [SKIP][374] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_rotation_crc@bad-pixel-format.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - shard-dg2-set2:     [DMESG-WARN][375] ([Intel XE#1033]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_rotation_crc@primary-rotation-180.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#2423] / [i915#2575]) -> [SKIP][378] ([Intel XE#1127])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2423] / [i915#2575]) -> [SKIP][380] ([Intel XE#3414])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-90.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [INCOMPLETE][381] -> [DMESG-WARN][382] ([Intel XE#1033])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_setmode@basic.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#330]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#455]) -> [SKIP][386] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_vrr@flip-dpms.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#2423] / [i915#2575]) -> [SKIP][388] ([Intel XE#2168])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_vrr@lobf.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#756]) -> [SKIP][390] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][392] ([Intel XE#2423] / [i915#2575])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     [DMESG-WARN][393] ([Intel XE#1033] / [Intel XE#2705]) -> [DMESG-WARN][394] ([Intel XE#2705])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@testdisplay.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@testdisplay.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1130]) -> [ABORT][396] ([Intel XE#2625])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_ccs@suspend-resume.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1123]) -> [SKIP][398] ([Intel XE#1130])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#1130]) -> [SKIP][400] ([Intel XE#1123])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1130]) -> [SKIP][402] ([Intel XE#1126])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1126]) -> [SKIP][404] ([Intel XE#1130])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#2905]) -> [SKIP][406] ([Intel XE#1130]) +15 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#1130]) -> [SKIP][408] ([Intel XE#2905]) +12 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_eudebug_online@resume-dss.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1130]) -> [DMESG-WARN][410] ([Intel XE#1033] / [Intel XE#1473])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_evict@evict-beng-large-external.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1130]) -> [SKIP][412] ([Intel XE#1392])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1130]) -> [SKIP][414] ([Intel XE#288]) +24 other tests skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#288]) -> [SKIP][416] ([Intel XE#1130]) +36 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#1130]) -> [SKIP][418] ([Intel XE#2360])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2360]) -> [SKIP][420] ([Intel XE#1130]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1130]) -> [SKIP][422] ([Intel XE#560])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#512]) -> [SKIP][424] ([Intel XE#1130])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_mmap@small-bar.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_mmap@small-bar.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1130]) -> [SKIP][426] ([Intel XE#2541] / [Intel XE#3573]) +8 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][428] ([Intel XE#1130]) +8 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_oa@syncs-userptr-wait-cfg.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#1130]) -> [SKIP][430] ([Intel XE#977])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][431] ([Intel XE#1130]) -> [SKIP][432] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][433] ([Intel XE#2284]) -> [SKIP][434] ([Intel XE#1130])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-dg2-set2:     [DMESG-WARN][435] ([Intel XE#1033]) -> [SKIP][436] ([Intel XE#1130]) +1 other test skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@d3hot-multiple-execs.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1130]) -> [DMESG-WARN][438] ([Intel XE#1033] / [Intel XE#569])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pm@s3-basic.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][440] ([Intel XE#1130]) +2 other tests skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-exec-after:
    - shard-dg2-set2:     [ABORT][441] ([Intel XE#1033] / [Intel XE#1358]) -> [DMESG-WARN][442] ([Intel XE#1033] / [Intel XE#569])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_pm@s3-exec-after.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][443] ([Intel XE#1033] / [Intel XE#569]) -> [SKIP][444] ([Intel XE#1130])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@s3-vm-bind-userptr.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#579]) -> [SKIP][446] ([Intel XE#1130])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@vram-d3cold-threshold.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     [SKIP][447] ([Intel XE#944]) -> [SKIP][448] ([Intel XE#1130])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][449] ([Intel XE#1130]) -> [SKIP][450] ([Intel XE#944]) +1 other test skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_query@multigpu-query-topology.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#4130]) -> [SKIP][452] ([Intel XE#1130]) +1 other test skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][453] ([Intel XE#1130]) -> [SKIP][454] ([Intel XE#3342])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_sriov_flr@flr-each-isolation.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#1130]) -> [ABORT][456] ([Intel XE#3075] / [Intel XE#3084])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4057]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4057
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2550-df181b47c540b5c4604c91929f4f346030955d53 -> xe-pw-142981v2

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2550-df181b47c540b5c4604c91929f4f346030955d53: df181b47c540b5c4604c91929f4f346030955d53
  xe-pw-142981v2: 142981v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/index.html

--===============4951604371205772747==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Test Xe2LPD DMC v2.27 (rev2)</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142981/">https://patchwork.freedesktop.org/series/142981/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142981v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142981v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2550-df181b47c540b5c4604c91929f4f34603=
0955d53_full -&gt; xe-pw-142981v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142981v2_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142981v2_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1429=
81v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-basic.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@xe_=
exec_balancer@many-execqueues-cm-virtual-basic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_ads_init.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard=
-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.=
html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_clas=
s_video_decode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-reside=
ncy-on-exec@gt0-engine-drm_xe_engine_class_video_decode.html">INCOMPLETE</a=
> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_at=
omic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142981v2/shard-dg2-436/igt@kms_atomic_transition@plane-all-modeset-trans=
ition.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pl=
ane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/sh=
ard-dg2-434/igt@kms_plane_scaling@intel-max-src-size.html">DMESG-WARN</a></=
li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142981v2_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@core_s=
etmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@core_set=
master@master-drop-set-shared-fd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@fbdev@=
info.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142981v2/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-addfb-size-overflow.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb=
@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +37 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms=
_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-r=
otate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_bw@linear-tiling-1-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_bw@linear-tiling-2-displa=
ys-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_ccs@bad-pixel-format-4-=
tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +202 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +7 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_chamelium_color@ctm-gre=
en-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_chamelium_hpd@dp-hpd-st=
orm-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_content_protection@dp-m=
st-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_content_protection@srm@=
pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_cursor_crc@cursor-onscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_cu=
rsor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_cursor_cr=
c@cursor-sliding-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +125 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_cursor_legacy@basic-bus=
y-flip-before-cursor-varying-size.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-2/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-8/igt@kms_display_mod=
es@extended-mode-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +3 other tests dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@c-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@fl=
ip-vs-expired-vblank@c-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-7/igt@kms_flip=
@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_flip@flip-=
vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +=
1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_flip@flip-vs-suspend-in=
terruptible@b-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-2/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp-9/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/i=
gt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">=
Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip=
@plain-flip-ts-check@c-dp2.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@kms_flip@plain-fli=
p-ts-check@c-dp2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-y.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adlp=
-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +13 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-=
big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@planes-up=
scale-20x20-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flo=
ps.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm=
_rpm@i2c.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#=
2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plan=
e-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-4/igt@kms_psr@psr-sprite-render.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic@pipe-b-dp-2=
-pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +4 other tests dmesg-wa=
rn</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-6/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-6/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_ccs@suspend-resume@tile6=
4-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_compute_preempt@compute-=
preempt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1280">Intel XE#1280</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_eudebug@basic-vm-access-=
parameters-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_eudebug_online@resume-on=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_exec_bal=
ancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +210 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-43=
2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Inte=
l XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-in=
valid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_gt_=
freq@freq_suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_gt_freq@freq_suspend.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_live_ktest@xe_mocs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030=
955d53/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f=
346030955d53/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c9=
1929f4f346030955d53/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c=
4604c91929f4f346030955d53/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c=
540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df1=
81b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-25=
50-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-d=
g2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f34603095=
5d53/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c91929f4f34=
6030955d53/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c4604c9192=
9f4f346030955d53/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540b5c460=
4c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b47c540=
b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-df181b=
47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2550-=
df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/sh=
ard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142981v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
63/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42981v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142981v2/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2=
-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142981v2/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-lnl-8/igt@xe_pat@pat-index-xelp.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@xe_pm@s3=
-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-prefetch.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm@s3-vm-bind-prefet=
ch.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-4/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-142981v2/shard-bmg-3/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@s4-vm-bind-userptr.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-4/igt@xe_pm_re=
sidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-142981v2/shard-bmg-3/igt@xe_pm_residency@cpg-basic.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1033">Intel XE#1033</a>) +12 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-reside=
ncy-on-exec.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@idle-residency-on-exec@gt0-engine-drm_xe_engine_clas=
s_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pm_residency@idle-reside=
ncy-on-exec@gt0-engine-drm_xe_engine_class_copy.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#10=
33</a>) +33 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster_vs_auth:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@core_s=
etmaster_vs_auth.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@core_setmast=
er_vs_auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-2/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-7/ig=
t@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pa=
ss</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-8/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel X=
E#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-142981v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0=
-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg=
-4/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_cu=
rsor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel=
 XE#1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142981v2/shard-dg2-434/igt@kms_cursor_legacy@long-nonblocking-modeset-v=
s-cursor-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@kms_fl=
ip@2x-flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-=
8/igt@kms_flip@2x-flip-vs-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +2 other =
tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank@b-dp4.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard=
-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank@b-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-8/igt@kms_flip=
@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-3/igt@kms_flip=
@flip-vs-panning-vs-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-7/ig=
t@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-3/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adl=
p-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-6/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-lnl-6/igt@km=
s_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
81v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-=
to-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_=
frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndsc=
rn-spr-indfb-onoff.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shar=
d-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html">PASS</=
a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-invalid-crtc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_le=
ase@lease-invalid-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
432/igt@kms_lease@lease-invalid-crtc.html">PASS</a> +67 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-adlp-3/igt@kms_pla=
ne_scaling@planes-scaler-unity-scaling@pipe-c.html">DMESG-WARN</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-adl=
p-2/igt@kms_plane_scaling@planes-scaler-unity-scaling@pipe-c.html">PASS</a>=
 +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm=
_rpm@universal-planes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_pm_=
rpm@universal-planes.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-lnl-7/igt@kms_psr2=
_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html">INCOMPLETE<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981=
v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pip=
e-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_setm=
ode@basic@pipe-b-dp-2.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic=
@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@kms_vb=
lank@ts-continuation-suspend.html">ABORT</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4057">Intel XE#4057</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/sha=
rd-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg=
2-436/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a> +3 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_liv=
e_ktest@xe_bo.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2229">Intel XE#2229</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_=
live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_liv=
e_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-46=
3/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_pm@=
s2idle-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1358">Intel XE#1358</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe=
_pm@s2idle-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-userptr-one-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_vm@=
mmap-style-bind-userptr-one-partial.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
34/igt@xe_vm@mmap-style-bind-userptr-one-partial.html">PASS</a> +157 other =
tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_as=
ync_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
66/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shar=
d-dg2-463/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2=
/shard-dg2-466/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136=
">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_bi=
g_fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_big_fb@y=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2981v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
81v2/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hf=
lip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@=
kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg=
2-466/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE=
#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Int=
el XE#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_bw=
@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
81v2/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-46=
6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142=
981v2/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981=
v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">=
Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard=
-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Inte=
l XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shar=
d-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#213=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-d=
g2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-463/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#30=
6</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ch=
amelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-43=
4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
466/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#242=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/sh=
ard-dg2-434/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_co=
ntent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-43=
2/igt@kms_content_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2=
/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel X=
E#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-142981v2/shard-dg2-463/igt@kms_cursor_legacy@short-busy-flip-before-=
cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/=
igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-43=
2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-=
dg2-463/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-46=
3/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-142981v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptibl=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fl=
ip@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@km=
s_flip@busy-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +10 other tests dmesg-w=
arn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
34/igt@kms_flip@flip-vs-absolute-wf_vblank.html">DMESG-WARN</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">In=
tel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_flip=
@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_flip@fl=
ip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/=
shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">In=
tel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142981v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp=
-ytileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">=
Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-142981v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-=
32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
142981v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +12 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2=
136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42981v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-=
indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb10=
1010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel =
XE#2351</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v=
2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel=
 XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel X=
E#2136</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-=
primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1429=
81v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2136">Intel XE#2136</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/=
igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +26 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_getfb@=
getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_jo=
iner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt=
@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_pl=
ane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_plane_cu=
rsor@overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2=
423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20=
x20-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_pl=
ane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Inte=
l XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_plane_scaling@planes-upscal=
e-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms=
_pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms=
_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@km=
s_pm_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_pm=
_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
466/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_ps=
r2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ps=
r2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@km=
s_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ps=
r@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
66/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
32/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@=
kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)=
 +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2136">Intel XE#2136</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-4=
66/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ps=
r@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@kms_=
psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-142981v2/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-=
overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@k=
ms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_ro=
tation_crc@primary-rotation-180.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2=
-466/igt@kms_rotation_crc@primary-rotation-180.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#25=
75</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
2981v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/sha=
rd-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-bmg-1/igt@kms_setm=
ode@basic.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142981v2/shard-bmg-1/igt@kms_setmode@basic.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_tv=
_load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@kms_vr=
r@lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@kms_wr=
iteback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-46=
6/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel =
XE#2849</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-142981v2/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2423">Intel XE#2423</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@testdi=
splay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@tes=
tdisplay.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_ccs=
@suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_ccs@suspen=
d-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2625">Intel XE#2625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_cop=
y_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/=
igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt=
@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_eud=
ebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +15 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_evi=
ct@evict-beng-large-external.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@=
xe_evict@evict-beng-large-external.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1=
473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-432/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/13=
92">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-d=
g2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-=
dg2-466/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Inte=
l XE#1130</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/s=
hard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
60">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1=
130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-463/igt@xe_mma=
p@small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/512">Intel XE#512</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_mmap@small-bar.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-46=
3/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
466/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +8 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_pat@pat-ind=
ex-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@=
d3hot-multiple-execs.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe=
_pm@d3hot-multiple-execs.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_pm@=
s3-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@xe_pm@s3-basic.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/=
igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-432/igt@xe_pm@=
s3-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-463/igt@=
xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@=
s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-=
466/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466/igt@xe_pm@vra=
m-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-436/igt@xe_que=
ry@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-466=
/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-432/igt@xe=
_query@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2=
-466/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#113=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-434/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2550-df181b47c540b5c4604c91929f4f346030955d53/shard-dg2-466/igt@xe_wed=
ged@wedged-mode-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142981v2/shard-dg2-436/igt@xe_wed=
ged@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2550-df181b47c540b5c4604c91929f4f346030955d53 -&gt; xe-pw-142=
981v2</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-2550-df181b47c540b5c4604c91929f4f346030955d53: df181b47c540b5c4604c919=
29f4f346030955d53<br />
  xe-pw-142981v2: 142981v2</p>

</body>
</html>

--===============4951604371205772747==--
