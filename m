Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04DEFF8860
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 19:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CE910E8F5;
	Mon, 27 Apr 2026 19:25:23 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB44810E2C8;
 Mon, 27 Apr 2026 19:25:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7941118890152200952=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_vfio/xe=3A_avoid_duplicate?=
 =?utf-8?q?_reset_in_xe=5Fvfio=5Fpci=5Freset=5Fdone_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: zhaoguohan@kylinos.cn
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Apr 2026 19:25:21 -0000
Message-ID: <177731792175.15806.14715676326201747452@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
In-Reply-To: <20260424091719.58800-1-zhaoguohan@kylinos.cn>
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

--===============7941118890152200952==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done (rev2)
URL   : https://patchwork.freedesktop.org/series/165429/
State : failure

== Summary ==

CI Bug Log - changes from xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b_FULL -> xe-pw-165429v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165429v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165429v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165429v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square-userenv-isvm:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_compute@compute-square-userenv-isvm.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_compute@compute-square-userenv-isvm.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-bmg:          [PASS][3] -> [SKIP][4] +11 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  
#### Warnings ####

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][5] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][7] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  
Known issues
------------

  Here are the changes found in xe-pw-165429v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2134]) +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@fbdev@nullptr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@fbdev@nullptr.html

  * igt@fbdev@pan:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#2488])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@fbdev@pan.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@fbdev@pan.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][13] -> [ABORT][14] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#7825]) +52 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_atomic@plane-invalid-params.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#3297]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_color@legacy-gamma-reset.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#6969]) +10 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6969] / [Intel XE#7006])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1340] / [Intel XE#7435])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_aux_dev@basic:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#3009])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dp_aux_dev@basic.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dp_aux_dev@basic.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2373])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_feature_discovery@display-1x.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2316]) +5 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2482]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2380]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2568])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_invalid_mode@bad-vsync-end.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#7086])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7130]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#7111]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@constant-alpha-min:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#7082]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_plane_alpha_blend@constant-alpha-min.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-min.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#2685] / [Intel XE#3307])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2763] / [Intel XE#6886]) +24 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#1439] / [Intel XE#836])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#7106])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_pm_rpm@system-suspend-idle.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#7112])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_properties@plane-properties-legacy.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#6361]) +4 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-8/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#7836]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_evict@evict-beng-small-cm.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_exec_balancer@many-virtual-rebind:
    - shard-bmg:          [PASS][59] -> [SKIP][60] ([Intel XE#7827]) +19 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_balancer@many-virtual-rebind.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_balancer@many-virtual-rebind.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][61] -> [SKIP][62] ([Intel XE#7826]) +24 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#7824]) +309 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [PASS][65] -> [SKIP][66] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_media_fill@media-fill.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-bmg:          [PASS][67] -> [SKIP][68] ([Intel XE#7839]) +5 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_oa@syncs-syncobj-cfg.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_oa@syncs-syncobj-cfg.html

  
#### Possible fixes ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [SKIP][69] ([Intel XE#2134]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@fbdev@unaligned-write.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@fbdev@unaligned-write.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [SKIP][71] ([Intel XE#1511] / [Intel XE#3297]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color@deep-color.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_color@deep-color.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          [SKIP][73] ([Intel XE#7006]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [SKIP][75] ([Intel XE#2316]) -> [PASS][76] +8 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][77] ([Intel XE#301]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-bmg:          [SKIP][79] ([Intel XE#2482]) -> [PASS][80] +7 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [SKIP][81] ([Intel XE#7178]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][83] ([Intel XE#2380]) -> [PASS][84] +2 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][85] ([Intel XE#1503]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@zero-clock:
    - shard-bmg:          [SKIP][87] ([Intel XE#2568]) -> [PASS][88] +2 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_invalid_mode@zero-clock.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_invalid_mode@zero-clock.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-bmg:          [SKIP][89] ([Intel XE#7825]) -> [PASS][90] +67 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier:
    - shard-bmg:          [SKIP][91] ([Intel XE#7283]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-bmg:          [SKIP][93] ([Intel XE#7111]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane@plane-panning-top-left.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@alpha-transparent-fb:
    - shard-bmg:          [SKIP][95] ([Intel XE#7082]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:
    - shard-bmg:          [SKIP][97] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][98] +29 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [SKIP][99] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [SKIP][101] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) -> [PASS][102]
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [SKIP][103] ([Intel XE#4886]) -> [PASS][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-bmg:          [SKIP][105] ([Intel XE#7089]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-bmg:          [SKIP][107] ([Intel XE#7112]) -> [PASS][108] +1 other test pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_properties@plane-properties-atomic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][109] ([Intel XE#6361]) -> [PASS][110] +2 other tests pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-bmg:          [SKIP][111] ([Intel XE#6568]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_evict@evict-threads-small:
    - shard-bmg:          [SKIP][113] ([Intel XE#7836]) -> [PASS][114] +7 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-threads-small.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][115] ([Intel XE#7827]) -> [PASS][116] +21 other tests pass
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:
    - shard-bmg:          [SKIP][117] ([Intel XE#7826]) -> [PASS][118] +30 other tests pass
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [INCOMPLETE][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:
    - shard-bmg:          [FAIL][121] -> [PASS][122] +6 other tests pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [SKIP][123] ([Intel XE#7824]) -> [PASS][124] +354 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:
    - shard-bmg:          [DMESG-FAIL][125] ([Intel XE#5545] / [Intel XE#6652]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          [SKIP][127] ([Intel XE#6703]) -> [PASS][128] +112 other tests pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [SKIP][129] ([Intel XE#7839]) -> [PASS][130] +7 other tests pass
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_oa@mmio-triggered-reports.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_pat@bo-comp-disable-bind:
    - shard-bmg:          [SKIP][131] ([Intel XE#6775] / [Intel XE#7590]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_pat@bo-comp-disable-bind.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@xe_pat@bo-comp-disable-bind.html

  * igt@xe_pat@pat-index-xe2:
    - shard-bmg:          [SKIP][133] ([Intel XE#7590]) -> [PASS][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_pat@pat-index-xe2.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          [FAIL][135] ([Intel XE#7695]) -> [PASS][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [SKIP][137] -> [PASS][138] +10 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_sriov_vram@vf-access-provisioned.html

  * igt@xe_vm@vm-get-property-exercise:
    - shard-bmg:          [DMESG-FAIL][139] -> [PASS][140]
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_vm@vm-get-property-exercise.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][141] ([Intel XE#7825]) -> [SKIP][142] ([Intel XE#2327]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-bmg:          [SKIP][143] ([Intel XE#2327]) -> [SKIP][144] ([Intel XE#7825]) +5 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][145] ([Intel XE#610] / [Intel XE#7387]) -> [SKIP][146] ([Intel XE#7825])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][147] ([Intel XE#7825]) -> [SKIP][148] ([Intel XE#1124]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][149] ([Intel XE#6703]) -> [SKIP][150] ([Intel XE#1124])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][151] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][152] ([Intel XE#7825])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][153] ([Intel XE#1124]) -> [SKIP][154] ([Intel XE#7825]) +8 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][155] ([Intel XE#2652]) -> [SKIP][156] ([Intel XE#7825])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][157] ([Intel XE#2887]) -> [SKIP][158] ([Intel XE#7825]) +11 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][159] ([Intel XE#7825]) -> [SKIP][160] ([Intel XE#3432])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][161] ([Intel XE#3432]) -> [SKIP][162] ([Intel XE#7825]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][163] ([Intel XE#7825]) -> [SKIP][164] ([Intel XE#2887]) +16 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-bmg:          [SKIP][165] ([Intel XE#6703]) -> [SKIP][166] ([Intel XE#2887]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][167] -> [SKIP][168] ([Intel XE#2724] / [Intel XE#7449])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cdclk@plane-scaling.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cdclk@plane-scaling.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][169] ([Intel XE#7006]) -> [SKIP][170] ([Intel XE#6969] / [Intel XE#7006])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][171] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][172] ([Intel XE#7825])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][173] ([Intel XE#7642]) -> [SKIP][174] ([Intel XE#7825])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][175] ([Intel XE#7825]) -> [SKIP][176] ([Intel XE#6974])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][177] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][178] ([Intel XE#7825])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@dp-mst-type-1-suspend-resume:
    - shard-bmg:          [SKIP][179] ([Intel XE#6974]) -> [SKIP][180] ([Intel XE#7825])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][181] ([Intel XE#7825]) -> [FAIL][182] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@suspend-resume.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][183] ([Intel XE#7825]) -> [SKIP][184] ([Intel XE#7642])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@type1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][185] ([Intel XE#7825]) -> [FAIL][186] ([Intel XE#6707] / [Intel XE#7439])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@uevent.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][187] ([Intel XE#6707] / [Intel XE#7439]) -> [SKIP][188] ([Intel XE#7825])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][189] ([Intel XE#2320]) -> [SKIP][190] ([Intel XE#7825]) +4 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][191] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][192] ([Intel XE#7825]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#2320])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_cursor_crc@cursor-random-max-size.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-bmg:          [SKIP][195] ([Intel XE#7825]) -> [SKIP][196] ([Intel XE#2320]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][197] ([Intel XE#7825]) -> [SKIP][198] ([Intel XE#2321] / [Intel XE#7355]) +3 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][199] ([Intel XE#1508]) -> [SKIP][200] ([Intel XE#7825])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][201] ([Intel XE#6703]) -> [SKIP][202] ([Intel XE#1508])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][203] ([Intel XE#2244]) -> [SKIP][204] ([Intel XE#7825])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][205] ([Intel XE#7825]) -> [SKIP][206] ([Intel XE#2244]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          [SKIP][207] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][208] ([Intel XE#7178])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][209] ([Intel XE#7178]) -> [SKIP][210] ([Intel XE#7178] / [Intel XE#7349])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][211] ([Intel XE#7178]) -> [SKIP][212] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][213] ([Intel XE#2311]) -> [SKIP][214] ([Intel XE#6314])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][215] ([Intel XE#6314]) -> [SKIP][216] ([Intel XE#2311]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][217] ([Intel XE#2311]) -> [SKIP][218] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +19 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][219] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][220] ([Intel XE#6314]) +5 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][221] ([Intel XE#4141]) -> [SKIP][222] ([Intel XE#6314])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][223] ([Intel XE#6314]) -> [SKIP][224] ([Intel XE#4141]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][225] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][226] ([Intel XE#4141]) +15 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][227] ([Intel XE#4141]) -> [SKIP][228] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +7 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [SKIP][229] ([Intel XE#6703]) -> [SKIP][230] ([Intel XE#4141]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][231] ([Intel XE#4141]) -> [SKIP][232] ([Intel XE#2548] / [Intel XE#6314]) +4 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][233] ([Intel XE#6703]) -> [SKIP][234] ([Intel XE#2352] / [Intel XE#7399])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][235] ([Intel XE#6703]) -> [SKIP][236] ([Intel XE#2311]) +4 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][237] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][238] ([Intel XE#2311]) +24 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][239] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][240] ([Intel XE#2311]) +7 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][241] ([Intel XE#2311]) -> [SKIP][242] ([Intel XE#2548] / [Intel XE#6314]) +4 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][243] ([Intel XE#6314]) -> [SKIP][244] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][245] ([Intel XE#2313]) -> [SKIP][246] ([Intel XE#6314]) +3 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][247] ([Intel XE#6314]) -> [SKIP][248] ([Intel XE#2313]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][249] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][250] ([Intel XE#2313]) +31 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][251] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][252] ([Intel XE#2352] / [Intel XE#7399])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          [SKIP][253] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][254] ([Intel XE#4141]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][255] ([Intel XE#2313]) -> [SKIP][256] ([Intel XE#2548] / [Intel XE#6314]) +27 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][257] ([Intel XE#6703]) -> [SKIP][258] ([Intel XE#2313]) +6 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][259] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][260] ([Intel XE#3544])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          [SKIP][261] -> [SKIP][262] ([Intel XE#6911] / [Intel XE#7378])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-bmg:          [SKIP][263] ([Intel XE#6703]) -> [SKIP][264] ([Intel XE#7283])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][265] ([Intel XE#2393]) -> [SKIP][266] ([Intel XE#7825]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][267] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][268] ([Intel XE#7825])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][269] ([Intel XE#7825]) -> [SKIP][270] ([Intel XE#5020] / [Intel XE#7348])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][271] ([Intel XE#6813]) -> [SKIP][272] ([Intel XE#6814] / [Intel XE#7428])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@package-g7.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][273] ([Intel XE#6703]) -> [SKIP][274] ([Intel XE#1489]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-sprite-render:
    - shard-bmg:          [SKIP][275] ([Intel XE#6703]) -> [SKIP][276] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_psr@psr-sprite-render.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_psr@psr-sprite-render.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][277] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][278] ([Intel XE#7825])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][279] ([Intel XE#7825]) -> [SKIP][280] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][281] ([Intel XE#6503]) -> [SKIP][282] ([Intel XE#7825]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          [SKIP][283] ([Intel XE#7825]) -> [SKIP][284] ([Intel XE#6503]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][285] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][286] ([Intel XE#2509] / [Intel XE#7437])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][287] ([Intel XE#7825]) -> [SKIP][288] ([Intel XE#1499]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_vrr@flip-suspend.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][289] ([Intel XE#6703]) -> [SKIP][290] ([Intel XE#1499])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-bmg:          [SKIP][291] ([Intel XE#6703]) -> [SKIP][292] ([Intel XE#7636]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][293] ([Intel XE#7836]) -> [INCOMPLETE][294] ([Intel XE#6321])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][295] ([Intel XE#6321]) -> [SKIP][296] ([Intel XE#7836])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][297] ([Intel XE#7140]) -> [SKIP][298] ([Intel XE#7836])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][299] ([Intel XE#7836]) -> [SKIP][300] ([Intel XE#7140]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][301] ([Intel XE#6703]) -> [SKIP][302] ([Intel XE#2322] / [Intel XE#7372])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][303] ([Intel XE#6703]) -> [SKIP][304] ([Intel XE#7136]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:
    - shard-bmg:          [SKIP][305] ([Intel XE#7826]) -> [SKIP][306] ([Intel XE#7136]) +15 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][307] ([Intel XE#7136]) -> [SKIP][308] ([Intel XE#7826]) +12 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][309] ([Intel XE#6703]) -> [SKIP][310] ([Intel XE#6874]) +5 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-fd-rebind:
    - shard-bmg:          [SKIP][311] ([Intel XE#6703]) -> [SKIP][312] ([Intel XE#7138])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          [SKIP][313] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384]) -> [SKIP][314] ([Intel XE#7323] / [Intel XE#7384])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_mmap@small-bar.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_mmap@small-bar.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          [SKIP][315] ([Intel XE#6703]) -> [SKIP][316] ([Intel XE#7590])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][317] ([Intel XE#6703]) -> [SKIP][318] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6775
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#7827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827
  [Intel XE#7836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836
  [Intel XE#7839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7839
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b -> xe-pw-165429v2

  IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b: fce38e768e144d1935086ce9fb66da3a9907029b
  xe-pw-165429v2: 165429v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html

--===============7941118890152200952==
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
<tr><td><b>Series:</b></td><td>vfio/xe: avoid duplicate reset in xe_vfio_pci_reset_done (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165429/">https://patchwork.freedesktop.org/series/165429/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b_FULL -&gt; xe-pw-165429v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165429v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165429v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165429v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square-userenv-isvm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_compute@compute-square-userenv-isvm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_compute@compute-square-userenv-isvm.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_copy_basic@mem-copy-linear-0xfd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> +11 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#7443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165429v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@fbdev@nullptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@pan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@fbdev@pan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@fbdev@pan.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2488">Intel XE#2488</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_atomic@plane-invalid-params.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_color@legacy-gamma-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_feature_discovery@display-1x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_plane_alpha_blend@constant-alpha-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-6/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-8/igt@kms_setmode@basic@pipe-a-dp-2-pipe-c-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_evict@evict-beng-small-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-beng-small-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_balancer@many-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_balancer@many-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +309 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_media_fill@media-fill.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_oa@syncs-syncobj-cfg.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7839">Intel XE#7839</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@fbdev@unaligned-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_color@deep-color.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip@2x-blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip@flip-vs-rmfb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_flip@flip-vs-rmfb-interruptible.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@zero-clock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_invalid_mode@zero-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_invalid_mode@zero-clock.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> +67 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@plane-panning-top-left.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-b.html">PASS</a> +29 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089">Intel XE#7089</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_properties@colorop-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_properties@plane-properties-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_properties@plane-properties-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_eu_stall@invalid-sampling-rate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_evict@evict-threads-small.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-userptr-rebind-imm.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_system_allocator@many-free-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@many-free-race-nomemset.html">PASS</a> +354 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@many-stride-mmap-free-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">PASS</a> +112 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7839">Intel XE#7839</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_oa@mmio-triggered-reports.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@bo-comp-disable-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_pat@bo-comp-disable-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6775">Intel XE#6775</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@xe_pat@bo-comp-disable-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pat@pat-index-xe2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_pat@pat-sw-hw-reset-compare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-exercise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_vm@vm-get-property-exercise.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_psr@psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-6/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7836">Intel XE#7836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-7/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-9/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165429v2/shard-bmg-10/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b -&gt; xe-pw-165429v2</li>
</ul>
<p>IGT_8873: a5c5d655807ead8204e01754b6434f0ecae40b96 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4939-fce38e768e144d1935086ce9fb66da3a9907029b: fce38e768e144d1935086ce9fb66da3a9907029b<br />
  xe-pw-165429v2: 165429v2</p>

</body>
</html>

--===============7941118890152200952==--
