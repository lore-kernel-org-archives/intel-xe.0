Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9F2FE5202
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 11:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64B0010F51E;
	Fri, 24 Apr 2026 11:23:19 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4414B10F51E;
 Fri, 24 Apr 2026 11:23:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5053114847743981567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Fix_AS_SDP_and_VRR_handlin?=
 =?utf-8?q?g_for_DP_branch_devices?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 11:23:18 -0000
Message-ID: <177702979826.7958.73264934862068513@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424090942.3060291-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260424090942.3060291-1-ankit.k.nautiyal@intel.com>
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

--===============5053114847743981567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix AS SDP and VRR handling for DP branch devices
URL   : https://patchwork.freedesktop.org/series/165415/
State : failure

== Summary ==

CI Bug Log - changes from xe-4931-5419b04d9030e3c4138e51331169ef80441cc908_FULL -> xe-pw-165415v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165415v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165415v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165415v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square-userenv:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_compute@compute-square-userenv.html

  * igt@xe_compute@compute-square-userenv-iosvm:
    - shard-bmg:          [PASS][2] -> [FAIL][3] +2 other tests fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_compute@compute-square-userenv-iosvm.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_compute@compute-square-userenv-iosvm.html

  * igt@xe_exec_balancer@many-execqueues-virtual-userptr:
    - shard-bmg:          [PASS][4] -> [SKIP][5] +21 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-virtual-userptr.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][6] +10 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][7] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_cdclk@plane-scaling.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][9] ([Intel XE#4090] / [Intel XE#7443]) -> [SKIP][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          [SKIP][11] ([Intel XE#7140]) -> [SKIP][12] +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_evict@evict-small-external-multi-queue-cm.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][13] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_oa@oa-tlb-invalidate.html

  
Known issues
------------

  Here are the changes found in xe-pw-165415v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@read:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@fbdev@read.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@fbdev@read.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2233])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic@plane-invalid-params:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#7825]) +29 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_atomic@plane-invalid-params.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_atomic@plane-invalid-params.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2327])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#610] / [Intel XE#7387])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#2887])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3432])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#3297])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_color@ctm-0-50.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6969]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6969] / [Intel XE#7006])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2390] / [Intel XE#6974])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#6707] / [Intel XE#7439])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2321] / [Intel XE#7355])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2320])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2291] / [Intel XE#7343])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4210] / [Intel XE#7467])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2372] / [Intel XE#7359])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#7705]) +3 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#3149] / [Intel XE#7705]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#2316]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2316]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@blocking-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2482])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@blocking-absolute-wf_vblank.html

  * igt@kms_flip@bo-too-big:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#2482]) +6 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_flip@bo-too-big.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@bo-too-big.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7178] / [Intel XE#7349])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#7178]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7178])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +6 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#656]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4141]) +5 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6314]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2311]) +16 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7061] / [Intel XE#7356])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2313]) +10 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2350] / [Intel XE#7503])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2548] / [Intel XE#6314]) +7 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#7061] / [Intel XE#7356])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2568])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_invalid_mode@bad-vsync-end.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#4298] / [Intel XE#5873])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#6911] / [Intel XE#7378])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#6901])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7591])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#7283])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7283]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@planar-pixel-format-settings:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#7780])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_plane@planar-pixel-format-settings.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane@planar-pixel-format-settings.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#7111])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#5021] / [Intel XE#7377])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2763] / [Intel XE#6886]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#2763] / [Intel XE#6886]) +14 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#7376] / [Intel XE#870])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_properties@colorop-properties-atomic:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#7089])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_properties@colorop-properties-atomic.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properties@colorop-properties-atomic.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#7112])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_properties@crtc-properties-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_properties@plane-properties-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#7112])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properties@plane-properties-atomic.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1489]) +6 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2387] / [Intel XE#7429])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#2234] / [Intel XE#2850]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#3904] / [Intel XE#7342])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#1435])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#1435])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#6503]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7825]) +20 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_vrr@seamless-rr-switch-virtual:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#1499]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-virtual.html

  * igt@xe_debugfs@check-gt-reg-sr@gt0:
    - shard-bmg:          NOTRUN -> [FAIL][102] ([Intel XE#7706]) +1 other test fail
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_debugfs@check-gt-reg-sr@gt0.html

  * igt@xe_eudebug@read-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#7636]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#7636]) +11 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#7140])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][107] -> [INCOMPLETE][108] ([Intel XE#6321])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:
    - shard-bmg:          [PASS][110] -> [SKIP][111] ([Intel XE#7826]) +14 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#7826]) +7 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#7136]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7136]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#6874]) +26 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#6874]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:
    - shard-bmg:          [PASS][117] -> [SKIP][118] ([Intel XE#7824]) +166 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#7824]) +66 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#7138]) +7 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146]) -> ([PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [SKIP][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172]) ([Intel XE#2457] / [Intel XE#7405])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-5/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-7/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-2/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#6964]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#7793]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#4733] / [Intel XE#7417])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#944])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][178] -> [DMESG-WARN][179] ([Intel XE#6627] / [Intel XE#7419])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe_survivability@runtime-survivability.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][180] ([Intel XE#2134]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@fbdev@nullptr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@fbdev@nullptr.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [SKIP][182] ([Intel XE#7825]) -> [PASS][183] +58 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][184] ([Intel XE#3297]) -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_color@ctm-blue-to-red.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_color@ctm-blue-to-red.html

  * igt@kms_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          [SKIP][186] ([Intel XE#7006]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-lut1d.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_cursor_crc@cursor-offscreen-128x128:
    - shard-bmg:          [SKIP][188] ([Intel XE#2320]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x128.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-128x128.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][190] ([Intel XE#2291]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [FAIL][192] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][194] ([Intel XE#2316]) -> [PASS][195] +5 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@busy-flip:
    - shard-bmg:          [SKIP][196] ([Intel XE#2482]) -> [PASS][197] +4 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip@busy-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@busy-flip.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-bmg:          [FAIL][198] ([Intel XE#6266]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip@dpms-vs-vblank-race.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][200] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][201] +7 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][202] ([Intel XE#4882]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [SKIP][204] ([Intel XE#7178]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-bmg:          [SKIP][206] ([Intel XE#2380]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][208] ([Intel XE#2548] / [Intel XE#6314]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-bmg:          [SKIP][210] ([Intel XE#2568]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-start.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_plane@plane-position-covered:
    - shard-bmg:          [SKIP][212] ([Intel XE#7111]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plane@plane-position-covered.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-bmg:          [SKIP][214] ([Intel XE#7082]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-basic.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-bmg:          [SKIP][216] ([Intel XE#2685] / [Intel XE#3307]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plane_scaling@intel-max-src-size.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [SKIP][218] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][219] +14 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][220] ([Intel XE#1131] / [Intel XE#3957]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_dc@dc5-dpms-negative.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][222] ([Intel XE#7340]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_dc@dc6-dpms.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [SKIP][224] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_rpm@dpms-non-lpsp.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [SKIP][226] ([Intel XE#4886]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_rpm@legacy-planes-dpms.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-bmg:          [INCOMPLETE][228] -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [SKIP][230] ([Intel XE#1435]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_setmode@basic.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_setmode@basic.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-bmg:          [SKIP][232] ([Intel XE#6568]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_eu_stall@invalid-event-report-count.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [SKIP][234] -> [PASS][235] +42 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-preempt-fence-early:
    - shard-bmg:          [DMESG-FAIL][236] -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_compute_mode@many-preempt-fence-early.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_exec_compute_mode@many-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - shard-bmg:          [SKIP][238] ([Intel XE#7826]) -> [PASS][239] +24 other tests pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-bmg:          [FAIL][240] -> [PASS][241] +4 other tests pass
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [SKIP][242] ([Intel XE#7824]) -> [PASS][243] +309 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_mmap@pci-membarrier:
    - shard-bmg:          [SKIP][244] ([Intel XE#5100]) -> [PASS][245] +2 other tests pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_mmap@pci-membarrier.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_mmap@pci-membarrier.html

  * igt@xe_pat@bo-comp-disable-bind:
    - shard-bmg:          [SKIP][246] ([Intel XE#6775] / [Intel XE#7590]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_pat@bo-comp-disable-bind.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_pat@bo-comp-disable-bind.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          [SKIP][248] ([Intel XE#7590]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_pat@false-sharing.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_pat@false-sharing.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][250] ([Intel XE#2245] / [Intel XE#7590]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_pat@pat-index-xelp.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_pat@pat-index-xelp.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][252] ([Intel XE#2327]) -> [SKIP][253] ([Intel XE#7825]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][254] ([Intel XE#7825]) -> [SKIP][255] ([Intel XE#2327]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][256] ([Intel XE#7825]) -> [SKIP][257] ([Intel XE#1124]) +9 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][258] ([Intel XE#7825]) -> [SKIP][259] ([Intel XE#610] / [Intel XE#7387])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][260] ([Intel XE#1124]) -> [SKIP][261] ([Intel XE#7825]) +5 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][262] ([Intel XE#7825]) -> [SKIP][263] ([Intel XE#2887]) +10 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][264] ([Intel XE#2887]) -> [SKIP][265] ([Intel XE#7825]) +7 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][266] ([Intel XE#7825]) -> [SKIP][267] ([Intel XE#3432]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][268] ([Intel XE#7825]) -> [SKIP][269] ([Intel XE#2652])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][270] ([Intel XE#2652]) -> [SKIP][271] ([Intel XE#7825])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][272] -> [SKIP][273] ([Intel XE#2724] / [Intel XE#7449])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][274] ([Intel XE#7006]) -> [SKIP][275] ([Intel XE#6969] / [Intel XE#7006])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][276] ([Intel XE#7825]) -> [SKIP][277] ([Intel XE#2390] / [Intel XE#6974])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          [SKIP][278] ([Intel XE#6974]) -> [SKIP][279] ([Intel XE#7825])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][280] ([Intel XE#7825]) -> [SKIP][281] ([Intel XE#7642])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_content_protection@mei-interface.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][282] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][283] ([Intel XE#7825])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_content_protection@srm.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][284] ([Intel XE#7825]) -> [FAIL][285] ([Intel XE#6707] / [Intel XE#7439])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          [SKIP][286] ([Intel XE#7825]) -> [SKIP][287] ([Intel XE#2321] / [Intel XE#7355])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][288] ([Intel XE#7825]) -> [SKIP][289] ([Intel XE#2320]) +6 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-max-size:
    - shard-bmg:          [SKIP][290] ([Intel XE#2320]) -> [SKIP][291] ([Intel XE#7825]) +3 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-max-size.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-max-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][292] ([Intel XE#7571]) -> [FAIL][293] ([Intel XE#7809])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][294] ([Intel XE#7825]) -> [SKIP][295] ([Intel XE#2286] / [Intel XE#6035])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][296] ([Intel XE#7825]) -> [SKIP][297] ([Intel XE#4331] / [Intel XE#7227])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][298] ([Intel XE#7825]) -> [SKIP][299] ([Intel XE#2244]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          [SKIP][300] ([Intel XE#7825]) -> [SKIP][301] ([Intel XE#4422] / [Intel XE#7442])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip_event_leak@basic:
    - shard-bmg:          [INCOMPLETE][302] -> [SKIP][303] ([Intel XE#7825])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_flip_event_leak@basic.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_event_leak@basic.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][304] ([Intel XE#7178]) -> [SKIP][305] ([Intel XE#7178] / [Intel XE#7351])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][306] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][307] ([Intel XE#2380])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][308] ([Intel XE#2311]) -> [SKIP][309] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +10 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][310] ([Intel XE#2311]) -> [SKIP][311] ([Intel XE#2312]) +1 other test skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][312] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][313] ([Intel XE#2311]) +18 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][314] ([Intel XE#4141]) -> [SKIP][315] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +6 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][316] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][317] ([Intel XE#4141]) +8 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][318] ([Intel XE#4141]) -> [SKIP][319] ([Intel XE#2312]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:
    - shard-bmg:          [SKIP][320] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][321] ([Intel XE#6314]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][322] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][323] ([Intel XE#4141]) +2 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][324] ([Intel XE#4141]) -> [SKIP][325] ([Intel XE#2548] / [Intel XE#6314])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][326] ([Intel XE#2311]) -> [SKIP][327] ([Intel XE#6314]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][328] ([Intel XE#6314]) -> [SKIP][329] ([Intel XE#2311]) +3 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][330] ([Intel XE#2312]) -> [SKIP][331] ([Intel XE#2311]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][332] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][333] ([Intel XE#2311]) +7 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][334] ([Intel XE#2311]) -> [SKIP][335] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][336] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][337] ([Intel XE#2548] / [Intel XE#6314])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][338] ([Intel XE#2313]) -> [SKIP][339] ([Intel XE#2548] / [Intel XE#6314]) +13 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][340] ([Intel XE#2313]) -> [SKIP][341] ([Intel XE#2312]) +1 other test skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][342] ([Intel XE#6314]) -> [SKIP][343] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][344] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][345] ([Intel XE#2313]) +26 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][346] ([Intel XE#6314]) -> [SKIP][347] ([Intel XE#2313]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][348] ([Intel XE#2312]) -> [SKIP][349] ([Intel XE#2313]) +3 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][350] ([Intel XE#7825]) -> [SKIP][351] ([Intel XE#3374] / [Intel XE#3544])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][352] ([Intel XE#2486]) -> [SKIP][353] ([Intel XE#7825])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_panel_fitting@atomic-fastset.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][354] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][355] ([Intel XE#7825])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][356] ([Intel XE#7825]) -> [SKIP][357] ([Intel XE#5020] / [Intel XE#7348])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][358] ([Intel XE#6813]) -> [SKIP][359] ([Intel XE#6814] / [Intel XE#7428])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_rpm@package-g7.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_pm_rpm@package-g7.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][360] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][361] ([Intel XE#7825])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-270.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][362] ([Intel XE#7825]) -> [SKIP][363] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][364] ([Intel XE#7825]) -> [SKIP][365] ([Intel XE#2413])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][366] ([Intel XE#6503]) -> [SKIP][367] ([Intel XE#7825])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_sharpness_filter@filter-basic.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][368] ([Intel XE#7825]) -> [SKIP][369] ([Intel XE#6503]) +3 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          [SKIP][370] ([Intel XE#7825]) -> [SKIP][371] ([Intel XE#1499])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_vrr@flip-basic.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][372] ([Intel XE#1499]) -> [SKIP][373] ([Intel XE#7825])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][374] ([Intel XE#7825]) -> [SKIP][375] ([Intel XE#2168] / [Intel XE#7444])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_vrr@lobf.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_vrr@lobf.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][376] -> [INCOMPLETE][377] ([Intel XE#6321])
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][378] -> [SKIP][379] ([Intel XE#7140]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][380] ([Intel XE#7136]) -> [SKIP][381] ([Intel XE#7826]) +5 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][382] ([Intel XE#7826]) -> [SKIP][383] ([Intel XE#7136]) +11 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2685]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3957
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6775
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#7706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7706
  [Intel XE#7780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7780
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4931-5419b04d9030e3c4138e51331169ef80441cc908 -> xe-pw-165415v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4931-5419b04d9030e3c4138e51331169ef80441cc908: 5419b04d9030e3c4138e51331169ef80441cc908
  xe-pw-165415v1: 165415v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/index.html

--===============5053114847743981567==
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
<tr><td><b>Series:</b></td><td>Fix AS SDP and VRR handling for DP branch de=
vices</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/165415/">https://patchwork.freedesktop.org/series/165415/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-165415v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-165415v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4931-5419b04d9030e3c4138e51331169ef804=
41cc908_FULL -&gt; xe-pw-165415v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165415v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-165415v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1654=
15v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square-userenv:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_compute@compute-square-use=
renv.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square-userenv-iosvm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_compu=
te@compute-square-userenv-iosvm.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_compute@co=
mpute-square-userenv-iosvm.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-virtual-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_exec=
_balancer@many-execqueues-virtual-userptr.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_=
exec_balancer@many-execqueues-virtual-userptr.html">SKIP</a> +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_balancer@once-cm-virt=
ual-userptr-invalidate-race.html">SKIP</a> +10 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_cdc=
lk@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/ig=
t@kms_cdclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443">Intel XE#=
7443</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
165415v1/shard-bmg-9/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_evic=
t@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg=
-9/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sha=
rd-bmg-9/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165415v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@fbdev@re=
ad.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-165415v1/shard-bmg-9/igt@fbdev@read.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_atom=
ic@plane-invalid-params.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_atomic@plane-inva=
lid-params.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7825">Intel XE#7825</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-si=
ze-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_color@ctm-0-50.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">=
Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_color_pipeline@plane-lut3=
d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_content_protection@uevent=
-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_cursor_crc@cursor-onscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@kms_cursor_=
legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_dirtyfb@fbc-dirtyfb-ioct=
l.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_feature_discovery@chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2372">Intel XE#2372</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg=
-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@bc-dp2-hdmi-a3.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705=
">Intel XE#7705</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_flip=
@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg=
-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible@cd-dp2-hdmi-a3.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149=
">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7705">Intel XE#7705</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-=
dpms-on-nop.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-expired-v=
blank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@blocking-absolute-wf=
_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2482">Intel XE#2482</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fli=
p@bo-too-big.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip@bo-too-big.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">In=
tel XE#2482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE=
#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fli=
p_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">In=
tel XE#6314</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +16 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7503">Intel XE#7503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +7 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_inv=
alid_mode@bad-vsync-end.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_invalid_mode@bad-=
vsync-end.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_joiner@basic-max-non-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4298">Intel XE#4298</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_multipipe_modeset@basic-=
max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_pla=
ne@pixel-format-4-tiled-modifier-source-clamping.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/=
igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel=
 XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane@pixel-format-yf-ti=
led-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_plan=
e@planar-pixel-format-settings.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane@plan=
ar-pixel-format-settings.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7780">Intel XE#7780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling=
-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#688=
6</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-d.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sha=
rd-bmg-9/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_pm_backlight@bad-brightn=
ess.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_prop=
erties@colorop-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properti=
es@colorop-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7089">Intel XE#7089</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_prop=
erties@crtc-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properties@=
crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_properties@plane-properti=
es-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7112">Intel XE#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb888=
8.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_psr@fbc-psr2-primary-pag=
e-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_rotation_crc@primary-y-t=
iled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_setmode@invalid-clone-exc=
lusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_sharpness_filter@filter-=
formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-=
filter-with-scaling-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +20 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-v=
irtual.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_debugfs@check-gt-reg-sr@gt0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_debugfs@check-gt-reg-sr@gt=
0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7706">Intel XE#7706</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_eudebug@read-metadata.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_eudebug_online@breakpoint-=
many-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +11 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_evict@evict-beng-mixed-thr=
eads-small.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_evict@evict-cm-threads-sm=
all-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_evict=
@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_evict@evic=
t-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#73=
72</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-bindexecqueue-rebind.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/i=
gt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel =
XE#7826</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_fault_mode@once-binde=
xecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-mul=
ti-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7136">Intel XE#7136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-race-prefetc=
h:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +26 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr-invalidate:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nomemset:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_exec=
_system_allocator@many-execqueues-mmap-file-mlock-nomemset.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sh=
ard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-file-mlock-nome=
mset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7824">Intel XE#7824</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-madvise=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-malloc-madvise.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +66 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7138">Intel XE#7138</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-=
bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/s=
hard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc9=
08/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef8044=
1cc908/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef=
80441cc908/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e513311=
69ef80441cc908/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e5=
1331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c41=
38e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e=
3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9=
030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5419b=
04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4931-5=
419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-49=
31-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4931-5419b04d9030e3c4138e51331169ef80441cc90=
8/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-=
bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-165415v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165415v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html">SKIP</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165415v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165415v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-165415v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/igt@xe=
_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency=
-copy-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_page_reclaim@prl-max-entri=
es.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@xe_pxp@pxp-stale-queue-post-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@xe_survi=
vability@runtime-survivability.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-3/igt@xe_survivabili=
ty@runtime-survivability.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</=
li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@fbdev@nu=
llptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@fbdev@nullptr.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_=
fb@linear-16bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_=
big_fb@linear-16bpp-rotate-180.html">PASS</a> +58 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_colo=
r@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_color@ct=
m-blue-to-red.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_colo=
r_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@k=
ms_color_pipeline@plane-lut1d-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x128:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_curs=
or_crc@cursor-offscreen-128x128.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/i=
gt@kms_cursor_crc@cursor-offscreen-128x128.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266"=
>Intel XE#6266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-on-nop-interru=
ptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@2x=
-nonexisting-fb.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
@busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@busy-flip.=
html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip=
@dpms-vs-vblank-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_flip@=
dpms-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Int=
el XE#6266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-165415v1/shard-bmg-10/igt@kms_flip@flip-vs-absolute-wf_vblank-interru=
ptible@c-dp2.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/=
igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#71=
78</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
5415v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-=
upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#=
2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
165415v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtil=
e-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#63=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
5415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html=
">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_inva=
lid_mode@bad-vsync-start.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_in=
valid_mode@bad-vsync-start.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plan=
e@plane-position-covered.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_p=
lane@plane-position-covered.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plan=
e_alpha_blend@alpha-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_p=
lane_alpha_blend@alpha-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plan=
e_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2685">Intel XE#2685</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3307">Intel XE#3307</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shar=
d-bmg-10/igt@kms_plane_scaling@intel-max-src-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plan=
e_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor=
-0-75-with-rotation.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_d=
c@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1131">Intel XE#1131</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3957">Intel XE#3957</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/i=
gt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_r=
pm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sh=
ard-bmg-10/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_r=
pm@legacy-planes-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_pm_rp=
m@legacy-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_rota=
tion_crc@multiplane-rotation-cropping-bottom.html">INCOMPLETE</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-=
8/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_setm=
ode@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_setmode@basic.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_eu_st=
all@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/ig=
t@xe_eu_stall@invalid-event-report-count.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-=
7/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS=
</a> +42 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-preempt-fence-early:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
compute_mode@many-preempt-fence-early.html">DMESG-FAIL</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@x=
e_exec_compute_mode@many-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
fault_mode@twice-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7=
/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> +24 other t=
ests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
sip@invalidinstr-walker-enabled.html">FAIL</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_exec_sip@i=
nvalidinstr-walker-enabled.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1654=
15v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc=
-race.html">PASS</a> +309 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_mmap@=
pci-membarrier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5100">Intel XE#5100</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_mmap@pci-memb=
arrier.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@bo-comp-disable-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_pat@b=
o-comp-disable-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6775">Intel XE#6775</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/=
igt@xe_pat@bo-comp-disable-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_pat@f=
alse-sharing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_pat@false-shari=
ng.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@xe_=
pat@pat-index-xelp.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_big_=
fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms=
_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_=
fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms=
_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_=
fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms=
_big_fb@y-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#738=
7</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms=
_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +5 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@=
bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-=
10/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_ccs@=
bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9=
/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard=
-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Inte=
l XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1=
/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_ccs@=
random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/ig=
t@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_cdclk@mode-=
transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/i=
gt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel =
XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_cont=
ent_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sha=
rd-bmg-9/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">=
Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_con=
tent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1=
/shard-bmg-9/igt@kms_content_protection@srm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_cont=
ent_protection@uevent-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@km=
s_content_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_curs=
or_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#=
7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_curs=
or_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@k=
ms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_curs=
or_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/ig=
t@kms_cursor_crc@cursor-onscreen-max-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-6/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/=
shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7=
227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_dsc@=
dsc-fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_dsc@dsc-=
fractional-bpp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2244">Intel XE#2244</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v=
1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_event_leak@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-2/igt@kms_flip=
_event_leak@basic.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_event_leak@b=
asic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">I=
ntel XE#7178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-165415v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-3=
2bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#71=
78</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/735=
1">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-t=
o-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1654=
15v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-mo=
ve.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2434">Intel XE#2434</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +10 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-165415v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2=
548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/63=
14">Intel XE#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb565-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-dr=
aw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2434">Intel XE#2434</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548"=
>Intel XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6314">Intel XE#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@f=
bc-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1654=
15v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-argb161616f-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-=
render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6=
314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
65415v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-mmap-wc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Inte=
l XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-=
pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE=
#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pr=
i-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#25=
48</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/631=
4">Intel XE#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-165415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-sc=
ndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
165415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1=
/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel =
XE#2548</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
5415v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pg=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2548">Intel XE#2548</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +13 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
415v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1=
/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE=
#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-165415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2313">Intel XE#2313</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE=
#6314</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-165415v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shr=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
65415v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_pan=
el_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_p=
anel_fitting@atomic-fastset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_pip=
e_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/=
shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#=
7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_plane_=
multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_rot=
ation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/sha=
rd-bmg-9/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@km=
s_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>=
) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@km=
s_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-10/igt@kms_sha=
rpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_=
sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_shar=
pness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bm=
g-10/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#=
6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_vrr@=
flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-10/igt@kms_vrr@flip-basic.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-9/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7825">Intel XE#7825</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">SKIP</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-165415v1/shard-bmg-1/igt@xe_evict@evict-sm=
all-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-1/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#=
7136</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
165415v1/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invali=
date-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7826">Intel XE#7826</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4931-5419b04d9030e3c4138e51331169ef80441cc908/shard-bmg-9/igt@xe_exec_=
fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#782=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165=
415v1/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-=
prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7136">Intel XE#7136</a>) +11 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4931-5419b04d9030e3c4138e51331169ef80441cc908 -&gt; xe-pw-165=
415v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4931-5419b04d9030e3c4138e51331169ef80441cc908: 5419b04d9030e3c4138e513=
31169ef80441cc908<br />
  xe-pw-165415v1: 165415v1</p>

</body>
</html>

--===============5053114847743981567==--
