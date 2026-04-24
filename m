Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F518FB44B2
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 12:35:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390310F551;
	Fri, 24 Apr 2026 12:35:43 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E2710F551;
 Fri, 24 Apr 2026 12:35:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3867722335533876629=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_AS_SDP_cleanups_and_additi?=
 =?utf-8?q?ons_for_Panel_Replay_+_VRR?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 12:35:42 -0000
Message-ID: <177703414286.7958.15087381011390966840@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260424093424.3060805-1-ankit.k.nautiyal@intel.com>
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

--===============3867722335533876629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: AS SDP cleanups and additions for Panel Replay + VRR
URL   : https://patchwork.freedesktop.org/series/165419/
State : failure

== Summary ==

CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL -> xe-pw-165419v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165419v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165419v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165419v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [PASS][1] -> [SKIP][2] +44 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +8 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_sip@invalidinstr-thread-enabled:
    - shard-bmg:          NOTRUN -> [FAIL][7] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-thread-enabled.html

  * igt@xe_oa@polling:
    - shard-bmg:          NOTRUN -> [SKIP][8] +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_oa@polling.html

  * igt@xe_vm@vm-get-property-exercise:
    - shard-bmg:          [PASS][9] -> [DMESG-FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_vm@vm-get-property-exercise.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html

  
#### Warnings ####

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          [SKIP][11] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_cdclk@mode-transition.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cdclk@mode-transition.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          [SKIP][13] ([Intel XE#7140]) -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  
Known issues
------------

  Here are the changes found in xe-pw-165419v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2134])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@fbdev@unaligned-write.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@fbdev@unaligned-write.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2652]) +15 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7825]) +27 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2325] / [Intel XE#7358])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2252])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#1511] / [Intel XE#3297])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_color@deep-color.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color@deep-color.html

  * igt@kms_color@legacy-gamma:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#3297])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color@legacy-gamma.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#7006])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_color_pipeline@plane-lut1d.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7006])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#6969]) +10 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6969] / [Intel XE#7006])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#6707] / [Intel XE#7439])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-128x128:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2320])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-128x128.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-128x128.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2316])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2316]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - shard-bmg:          [PASS][39] -> [FAIL][40] ([Intel XE#6266]) +3 other tests fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#2482]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@plain-flip-interruptible:
    - shard-bmg:          [PASS][42] -> [SKIP][43] ([Intel XE#2482]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_flip@plain-flip-interruptible.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@plain-flip-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#7178] / [Intel XE#7349])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-bmg:          [PASS][45] -> [SKIP][46] ([Intel XE#7178])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7178] / [Intel XE#7351])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#2380]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2380])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2311]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +8 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4141])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6314])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2313]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2548] / [Intel XE#6314]) +8 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_invalid_mode@bad-htotal:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2568])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_invalid_mode@bad-htotal.html

  * igt@kms_invalid_mode@int-max-clock:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2568]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_invalid_mode@int-max-clock.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#6901])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7591])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7283])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7111])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-bmg:          [PASS][64] -> [SKIP][65] ([Intel XE#7111])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_plane@plane-panning-top-left.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_alpha_blend@constant-alpha-max:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#7082]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_plane_alpha_blend@constant-alpha-max.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-max.html

  * igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#7082])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - shard-bmg:          [PASS][70] -> [SKIP][71] ([Intel XE#2763] / [Intel XE#6886]) +24 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7376] / [Intel XE#870])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-bmg:          [PASS][73] -> [FAIL][74] ([Intel XE#7340])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#1439] / [Intel XE#836])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][78] -> [SKIP][79] ([Intel XE#4886])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1489]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr-sprite-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_psr@psr-sprite-plane-move.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [PASS][82] -> [SKIP][83] ([Intel XE#7825]) +51 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_sequence@get-idle.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_sequence@get-idle.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#1499])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#2142]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#6568])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_eu_stall@invalid-sampling-rate.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eu_stall@unprivileged-access:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6568])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eu_stall@unprivileged-access.html

  * igt@xe_eudebug_online@interrupt-reconnect:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7636]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-reconnect.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#7826]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#7826]) +23 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#6874]) +11 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_system_allocator@process-many-new-nomemset:
    - shard-bmg:          [PASS][96] -> [SKIP][97] ([Intel XE#7824]) +311 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-new-nomemset.html

  * igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#7824]) +77 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#7138]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2229])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#5100])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#6964])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-bmg:          [PASS][104] -> [SKIP][105] ([Intel XE#7590])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_pat@display-vs-wb-transient.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#7695])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#7590])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [PASS][110] -> [DMESG-WARN][111] ([Intel XE#5545])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][112] ([Intel XE#2134]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@fbdev@write.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@fbdev@write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][114] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][115] +2 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][116] ([Intel XE#6078]) -> [PASS][117]
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][118] ([Intel XE#7825]) -> [PASS][119] +98 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@gamma:
    - shard-bmg:          [SKIP][120] ([Intel XE#3297]) -> [PASS][121] +4 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color@gamma.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_color@gamma.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          [SKIP][122] ([Intel XE#7006]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][124] ([Intel XE#2291]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][126] ([Intel XE#2373] / [Intel XE#7344]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_feature_discovery@display-2x.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][128] ([Intel XE#3321]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][130] ([Intel XE#2316]) -> [PASS][131] +12 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][132] ([Intel XE#4882]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [SKIP][134] ([Intel XE#2482]) -> [PASS][135] +8 other tests pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [SKIP][136] ([Intel XE#7178]) -> [PASS][137] +1 other test pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-bmg:          [SKIP][138] ([Intel XE#2380]) -> [PASS][139] +2 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][140] ([Intel XE#2548] / [Intel XE#6314]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][142] ([Intel XE#1503]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_hdr@invalid-hdr.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@clock-too-high:
    - shard-bmg:          [SKIP][144] ([Intel XE#2568]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_invalid_mode@clock-too-high.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][146] ([Intel XE#7111]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          [SKIP][148] ([Intel XE#7082]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-bmg:          [SKIP][150] ([Intel XE#7687]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - shard-bmg:          [SKIP][152] ([Intel XE#2763] / [Intel XE#6886]) -> [PASS][153] +44 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [SKIP][154] ([Intel XE#1131] / [Intel XE#3957]) -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_dc@dc5-dpms-negative.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][156] ([Intel XE#7340]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_dc@dc6-dpms.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][158] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][160] ([Intel XE#7079]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-bmg:          [SKIP][162] ([Intel XE#4886]) -> [PASS][163] +2 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_properties@colorop-properties-legacy:
    - shard-bmg:          [SKIP][164] ([Intel XE#7089]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_properties@colorop-properties-legacy.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-bmg:          [SKIP][166] ([Intel XE#7112]) -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [SKIP][168] ([Intel XE#1435]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_setmode@basic.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-bmg:          [SKIP][170] ([Intel XE#6568]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_eu_stall@non-blocking-re-enable.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          [SKIP][172] ([Intel XE#7827]) -> [PASS][173] +13 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_compute_mode@many-preempt-fence-early:
    - shard-bmg:          [DMESG-FAIL][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_compute_mode@many-preempt-fence-early.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_compute_mode@many-preempt-fence-early.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-bmg:          [SKIP][176] ([Intel XE#7826]) -> [PASS][177] +38 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-bmg:          [DMESG-WARN][178] -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_reset@cm-cat-error.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_sip@invalidinstr-walker-enabled:
    - shard-bmg:          [FAIL][180] -> [PASS][181] +5 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_sip@invalidinstr-walker-enabled.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:
    - shard-bmg:          [SKIP][182] ([Intel XE#7824]) -> [PASS][183] +541 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][184] ([Intel XE#2229]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_live_ktest@xe_bo.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@pci-membarrier:
    - shard-bmg:          [SKIP][186] ([Intel XE#5100]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_mmap@pci-membarrier.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_pat@false-sharing:
    - shard-bmg:          [SKIP][188] ([Intel XE#7590]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@false-sharing.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_pat@false-sharing.html

  * igt@xe_sriov_vram@vf-access-provisioned:
    - shard-bmg:          [SKIP][190] -> [PASS][191] +67 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_sriov_vram@vf-access-provisioned.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][192] ([Intel XE#2370]) -> [SKIP][193] ([Intel XE#7825])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][194] ([Intel XE#7825]) -> [SKIP][195] ([Intel XE#2327]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          [SKIP][196] ([Intel XE#2327]) -> [SKIP][197] ([Intel XE#7825]) +4 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][198] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][199] ([Intel XE#7825])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][200] ([Intel XE#7825]) -> [SKIP][201] ([Intel XE#7059] / [Intel XE#7085])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][202] ([Intel XE#7825]) -> [SKIP][203] ([Intel XE#1124]) +16 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][204] ([Intel XE#607] / [Intel XE#7361]) -> [SKIP][205] ([Intel XE#7825])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][206] ([Intel XE#7825]) -> [SKIP][207] ([Intel XE#610] / [Intel XE#7387])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][208] ([Intel XE#2328] / [Intel XE#7367]) -> [SKIP][209] ([Intel XE#7825])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][210] ([Intel XE#7825]) -> [SKIP][211] ([Intel XE#607] / [Intel XE#7361])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][212] ([Intel XE#1124]) -> [SKIP][213] ([Intel XE#7825]) +8 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][214] ([Intel XE#7825]) -> [SKIP][215] ([Intel XE#2887]) +25 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][216] ([Intel XE#2652]) -> [SKIP][217] ([Intel XE#7825])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][218] ([Intel XE#7825]) -> [SKIP][219] ([Intel XE#2652]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][220] ([Intel XE#3432]) -> [SKIP][221] ([Intel XE#7825])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          [SKIP][222] ([Intel XE#7825]) -> [SKIP][223] ([Intel XE#3432]) +2 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][224] ([Intel XE#2887]) -> [SKIP][225] ([Intel XE#7825]) +15 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][226] -> [SKIP][227] ([Intel XE#2724] / [Intel XE#7449])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][228] ([Intel XE#7006]) -> [SKIP][229] ([Intel XE#6969] / [Intel XE#7006])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [FAIL][230] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][231] ([Intel XE#7825]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_content_protection@atomic-hdcp14.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][232] ([Intel XE#7825]) -> [SKIP][233] ([Intel XE#7642]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@content-type-change.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][234] ([Intel XE#7825]) -> [SKIP][235] ([Intel XE#2390] / [Intel XE#6974])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][236] ([Intel XE#6974]) -> [SKIP][237] ([Intel XE#7825])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][238] ([Intel XE#7825]) -> [FAIL][239] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][240] ([Intel XE#7642]) -> [SKIP][241] ([Intel XE#7825])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_content_protection@type1.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [SKIP][242] ([Intel XE#7825]) -> [FAIL][243] ([Intel XE#6707] / [Intel XE#7439])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][244] ([Intel XE#7825]) -> [SKIP][245] ([Intel XE#2320]) +10 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][246] ([Intel XE#2320]) -> [SKIP][247] ([Intel XE#7825]) +5 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][248] ([Intel XE#7825]) -> [SKIP][249] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][250] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][251] ([Intel XE#7825]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          [SKIP][252] ([Intel XE#7825]) -> [SKIP][253] ([Intel XE#2286] / [Intel XE#6035])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][254] ([Intel XE#1508]) -> [SKIP][255] ([Intel XE#7825])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][256] ([Intel XE#7825]) -> [SKIP][257] ([Intel XE#1508])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][258] ([Intel XE#4354] / [Intel XE#7386]) -> [SKIP][259] ([Intel XE#7825])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][260] ([Intel XE#7825]) -> [SKIP][261] ([Intel XE#4354] / [Intel XE#5870])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-bmg:          [SKIP][262] ([Intel XE#7825]) -> [SKIP][263] ([Intel XE#4331] / [Intel XE#7227])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          [SKIP][264] ([Intel XE#7825]) -> [SKIP][265] ([Intel XE#2244]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][266] ([Intel XE#7825]) -> [SKIP][267] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][268] -> [SKIP][269] ([Intel XE#4156] / [Intel XE#7425])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][270] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][271] ([Intel XE#7178])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][272] ([Intel XE#2380]) -> [SKIP][273] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][274] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][275] ([Intel XE#2380])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][276] ([Intel XE#7178]) -> [SKIP][277] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][278] ([Intel XE#6314]) -> [SKIP][279] ([Intel XE#2311]) +2 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][280] ([Intel XE#2311]) -> [SKIP][281] ([Intel XE#6314]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][282] ([Intel XE#2311]) -> [SKIP][283] ([Intel XE#2312]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][284] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][285] ([Intel XE#6314]) +3 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][286] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][287] ([Intel XE#2311]) +33 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][288] ([Intel XE#4141]) -> [SKIP][289] ([Intel XE#6314]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][290] ([Intel XE#6314]) -> [SKIP][291] ([Intel XE#4141])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][292] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) -> [SKIP][293] ([Intel XE#4141]) +18 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][294] ([Intel XE#4141]) -> [SKIP][295] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +13 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [SKIP][296] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][297] ([Intel XE#4141]) +4 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][298] ([Intel XE#4141]) -> [SKIP][299] ([Intel XE#2548] / [Intel XE#6314]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          [SKIP][300] ([Intel XE#2352] / [Intel XE#7399]) -> [SKIP][301] ([Intel XE#2548] / [Intel XE#6314])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][302] ([Intel XE#2311]) -> [SKIP][303] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +19 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][304] ([Intel XE#2312]) -> [SKIP][305] ([Intel XE#2311])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][306] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][307] ([Intel XE#2311]) +11 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][308] ([Intel XE#6314]) -> [SKIP][309] ([Intel XE#7061] / [Intel XE#7356]) +11 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][310] ([Intel XE#2311]) -> [SKIP][311] ([Intel XE#2548] / [Intel XE#6314]) +5 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][312] ([Intel XE#2313]) -> [SKIP][313] ([Intel XE#2312])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][314] ([Intel XE#2313]) -> [SKIP][315] ([Intel XE#6314]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][316] ([Intel XE#6314]) -> [SKIP][317] ([Intel XE#2313]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][318] ([Intel XE#2313]) -> [SKIP][319] ([Intel XE#2548] / [Intel XE#6314]) +25 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][320] ([Intel XE#2312]) -> [SKIP][321] ([Intel XE#2313]) +1 other test skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][322] ([Intel XE#2548] / [Intel XE#6314]) -> [SKIP][323] ([Intel XE#2313]) +47 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][324] ([Intel XE#7825]) -> [SKIP][325] ([Intel XE#3374] / [Intel XE#3544])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][326] -> [SKIP][327] ([Intel XE#6911] / [Intel XE#7466])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@basic-force-ultra-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          [SKIP][328] -> [SKIP][329] ([Intel XE#6911] / [Intel XE#7378])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][330] ([Intel XE#2486]) -> [SKIP][331] ([Intel XE#7825])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_panel_fitting@legacy.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          [SKIP][332] ([Intel XE#7283]) -> [SKIP][333] ([Intel XE#7111])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][334] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][335] ([Intel XE#7825])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][336] ([Intel XE#7825]) -> [SKIP][337] ([Intel XE#5020] / [Intel XE#7348])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][338] ([Intel XE#6813]) -> [SKIP][339] ([Intel XE#6814] / [Intel XE#7428])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@package-g7.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          [SKIP][340] ([Intel XE#7825]) -> [SKIP][341] ([Intel XE#3904] / [Intel XE#7342]) +3 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][342] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][343] ([Intel XE#7825]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][344] ([Intel XE#2413]) -> [SKIP][345] ([Intel XE#7825])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          [SKIP][346] ([Intel XE#7825]) -> [SKIP][347] ([Intel XE#6503]) +3 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][348] ([Intel XE#6503]) -> [SKIP][349] ([Intel XE#7825]) +1 other test skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][350] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][351] ([Intel XE#7825])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][352] ([Intel XE#7825]) -> [SKIP][353] ([Intel XE#2426] / [Intel XE#5848])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][354] ([Intel XE#7825]) -> [SKIP][355] ([Intel XE#2168] / [Intel XE#7444]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_vrr@lobf.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][356] ([Intel XE#1499]) -> [SKIP][357] ([Intel XE#7825]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [SKIP][358] -> [INCOMPLETE][359] ([Intel XE#6321])
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][360] -> [SKIP][361] ([Intel XE#7140]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault:
    - shard-bmg:          [SKIP][362] ([Intel XE#7136]) -> [SKIP][363] ([Intel XE#7826]) +12 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:
    - shard-bmg:          [SKIP][364] ([Intel XE#7826]) -> [SKIP][365] ([Intel XE#7136]) +25 other tests skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1511]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
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
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3957]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3957
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7079]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7089]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824
  [Intel XE#7825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825
  [Intel XE#7826]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826
  [Intel XE#7827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -> xe-pw-165419v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e
  xe-pw-165419v1: 165419v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html

--===============3867722335533876629==
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
<tr><td><b>Series:</b></td><td>AS SDP cleanups and additions for Panel Replay + VRR</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165419/">https://patchwork.freedesktop.org/series/165419/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e_FULL -&gt; xe-pw-165419v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165419v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165419v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165419v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_balancer@many-cm-parallel-basic.html">SKIP</a> +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-thread-enabled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-thread-enabled.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_oa@polling.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@vm-get-property-exercise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_vm@vm-get-property-exercise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_vm@vm-get-property-exercise.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cdclk@mode-transition.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165419v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_color@deep-color.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color@deep-color.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1511">Intel XE#1511</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color@legacy-gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_color_pipeline@plane-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x128:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-128x128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-128x128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_flip@plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip@plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-htotal:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_invalid_mode@bad-htotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@int-max-clock:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_invalid_mode@int-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_invalid_mode@int-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_plane_alpha_blend@constant-alpha-max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_alpha_blend@constant-alpha-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_alpha_blend@coverage-vs-premult-vs-constant.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_psr@psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_sequence@get-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +51 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_eu_stall@invalid-sampling-rate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@unprivileged-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eu_stall@unprivileged-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-reconnect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_eudebug_online@interrupt-reconnect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_system_allocator@process-many-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +311 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_system_allocator@twice-large-mmap-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) +77 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@xe_pat@display-vs-wb-transient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_pat@pat-sw-hw-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +98 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_color@gamma.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4882">Intel XE#4882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_invalid_mode@clock-too-high.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_invalid_mode@clock-too-high.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-7efc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_plane_scaling@invalid-parameters.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">PASS</a> +44 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3957">Intel XE#3957</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079">Intel XE#7079</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_pm_rpm@universal-planes.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_properties@colorop-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@colorop-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7089">Intel XE#7089</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_properties@colorop-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_setmode@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_eu_stall@non-blocking-re-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_eu_stall@non-blocking-re-enable.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7827">Intel XE#7827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-preempt-fence-early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_compute_mode@many-preempt-fence-early.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_compute_mode@many-preempt-fence-early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_reset@cm-cat-error.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_exec_reset@cm-cat-error.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-walker-enabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_sip@invalidinstr-walker-enabled.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_sip@invalidinstr-walker-enabled.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7824">Intel XE#7824</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-race.html">PASS</a> +541 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_mmap@pci-membarrier.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@false-sharing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_pat@false-sharing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_pat@false-sharing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-provisioned:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_sriov_vram@vf-access-provisioned.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@xe_sriov_vram@vf-access-provisioned.html">PASS</a> +67 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@lic-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_content_protection@lic-type-0-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7227">Intel XE#7227</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814">Intel XE#6814</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-1/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444">Intel XE#7444</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7825">Intel XE#7825</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-beng-mixed-many-threads-small.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7826">Intel XE#7826</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165419v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +25 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e -&gt; xe-pw-165419v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4932-15ccea1aede9d776f85ed002cf0df3c8ea8bd81e: 15ccea1aede9d776f85ed002cf0df3c8ea8bd81e<br />
  xe-pw-165419v1: 165419v1</p>

</body>
</html>

--===============3867722335533876629==--
