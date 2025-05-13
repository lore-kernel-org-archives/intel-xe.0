Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E21C3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 12:40:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3CA10E5A0;
	Tue, 13 May 2025 12:40:56 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DAE10E59F;
 Tue, 13 May 2025 12:40:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6575821724204023117=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Reduce_DPT_table?=
 =?utf-8?q?_alignment_as_in_i915_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 12:40:54 -0000
Message-ID: <174714005498.75033.14206926031798784192@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
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

--===============6575821724204023117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reduce DPT table alignment as in i915 (rev2)
URL   : https://patchwork.freedesktop.org/series/148868/
State : failure

== Summary ==

CI Bug Log - changes from xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f_FULL -> xe-pw-148868v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148868v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148868v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148868v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +11 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-dp-2-4-rc-ccs:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][3] +5 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-dp-2-4-rc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][4] -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [ABORT][7] +1 other test abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html

  
Known issues
------------

  Here are the changes found in xe-pw-148868v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [PASS][8] -> [SKIP][9] ([Intel XE#2134]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@fbdev@nullptr.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@fbdev@nullptr.html

  * igt@intel_sysfs_debugfs@xe-base:
    - shard-dg2-set2:     [PASS][10] -> [SKIP][11] ([Intel XE#4208] / [Intel XE#4618])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@intel_sysfs_debugfs@xe-base.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@intel_sysfs_debugfs@xe-base.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] ([Intel XE#4543]) +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][14] -> [DMESG-FAIL][15] ([Intel XE#4626]) +6 other tests dmesg-fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#4677]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][18] -> [DMESG-FAIL][19] ([Intel XE#4543]) +4 other tests dmesg-fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#3884]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#3908]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2327])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2328])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2314] / [Intel XE#2894])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#367])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#787]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +26 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +181 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#4416]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#306])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2252])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][39] ([Intel XE#1178]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2320]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#4208] / [i915#2575]) +38 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#2953] / [Intel XE#4173])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][44] -> [SKIP][45] ([Intel XE#2291]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#1340])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [PASS][48] -> [SKIP][49] ([Intel XE#4294])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][50] -> [FAIL][51] ([Intel XE#301] / [Intel XE#3321])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][52] -> [FAIL][53] ([Intel XE#3321])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][54] -> [FAIL][55] ([Intel XE#301])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2316]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][57] -> [SKIP][58] ([Intel XE#2316]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([Intel XE#4208] / [i915#2575]) +94 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_flip@busy-flip.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#886])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_flip@plain-flip-ts-check.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#886])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-check@a-hdmi-a2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +6 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2293] / [Intel XE#2380])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2293])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#651])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][70] -> [INCOMPLETE][71] ([Intel XE#2050])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#656]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2312]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2311]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#2351] / [Intel XE#4208]) +16 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2313]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#1503])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_hdr@static-swap.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_hdr@static-swap.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#2925])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][82] ([Intel XE#616]) +2 other tests fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#4596])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2763]) +5 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][86] ([Intel XE#1129])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-psr-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#2883]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1435])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#1435])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:
    - shard-dg2-set2:     [PASS][95] -> [DMESG-WARN][96] ([Intel XE#4212])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html

  * igt@kms_vblank@wait-forked-hang:
    - shard-adlp:         [PASS][97] -> [DMESG-WARN][98] ([Intel XE#4173]) +1 other test dmesg-warn
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_vblank@wait-forked-hang.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@kms_vblank@wait-forked-hang.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#455]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][101] ([Intel XE#4837]) +2 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#4837])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#1392])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-dg2-set2:     [PASS][104] -> [SKIP][105] ([Intel XE#1392]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][107] ([Intel XE#288])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][108] -> [DMESG-WARN][109] ([Intel XE#3868])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_exec_reset@cm-close-fd.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#4943]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#4915]) +9 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][112] -> [FAIL][113] ([Intel XE#5018])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#4929] / [Intel XE#5018])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][116] -> [SKIP][117] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_live_ktest@xe_bo.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [PASS][118] -> [SKIP][119] ([Intel XE#2229])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144]) -> ([PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [SKIP][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170]) ([Intel XE#2457])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-3/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-3/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-3/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][171] -> [FAIL][172] ([Intel XE#4208])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@reload-no-display.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2248])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][174] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#366])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][176] -> [ABORT][177] ([Intel XE#1794])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_pm@s4-basic-exec.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [PASS][178] -> [ABORT][179] ([Intel XE#1794]) +1 other test abort
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][180] ([Intel XE#4733])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#4208]) +178 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_vm@large-split-binds-536870912.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
    - shard-dg2-set2:     [PASS][182] -> [SKIP][183] ([Intel XE#4208]) +202 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#2134]) -> [PASS][185] +1 other test pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@fbdev@read.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@fbdev@read.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#4208] / [Intel XE#4618]) -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [DMESG-WARN][188] ([Intel XE#4543]) -> [PASS][189] +2 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@kms_async_flips@invalid-async-flip.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][190] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][191] +11 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][192] ([Intel XE#2291]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][194] ([Intel XE#4302]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_display_modes@extended-mode-basic.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][196] ([Intel XE#3321]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [SKIP][198] ([Intel XE#2316]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_flip@2x-plain-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][200] ([Intel XE#301]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][202] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [ABORT][204] -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#455]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [SKIP][208] ([Intel XE#1503]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_hdr@static-toggle-dpms.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#4208] / [i915#2575]) -> [PASS][211] +124 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#4208]) -> [PASS][213] +270 other tests pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#1392]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][216] ([Intel XE#4792]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [SKIP][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243]) ([Intel XE#378]) -> ([PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [PASS][255], [PASS][256], [PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-4/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-2/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-2/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-2/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281], [PASS][282], [PASS][283], [PASS][284], [PASS][285], [PASS][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [SKIP][293], [PASS][294]) ([Intel XE#378]) -> ([PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_load@load.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-436/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-436/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-436/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [FAIL][320] ([Intel XE#4208]) -> [PASS][321] +2 other tests pass
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@reload.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#623]) -> [SKIP][323] ([Intel XE#4208] / [i915#2575])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][325] ([Intel XE#316]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#316]) -> [SKIP][327] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#4208]) -> [SKIP][329] ([Intel XE#316])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#316]) -> [SKIP][331] ([Intel XE#4208]) +3 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][333] ([Intel XE#1124]) +3 other tests skip
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1124]) -> [SKIP][335] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [SKIP][337] ([Intel XE#1124]) +13 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#4208]) -> [SKIP][339] ([Intel XE#607])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#1124]) -> [SKIP][341] ([Intel XE#4208]) +5 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#2191]) -> [SKIP][343] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#4208] / [i915#2575]) -> [SKIP][345] ([Intel XE#2191]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#367]) -> [SKIP][347] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#4208] / [i915#2575]) -> [SKIP][349] ([Intel XE#367]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][351] ([Intel XE#455] / [Intel XE#787])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2907]) -> [SKIP][353] ([Intel XE#4208]) +2 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][355] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#4208]) -> [SKIP][357] ([Intel XE#2907])
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#4208]) -> [SKIP][359] ([Intel XE#455] / [Intel XE#787]) +18 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][361] ([Intel XE#4208]) +7 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#373]) -> [SKIP][363] ([Intel XE#4208] / [i915#2575]) +13 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_chamelium_audio@dp-audio.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#306]) -> [SKIP][365] ([Intel XE#4208] / [i915#2575])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_chamelium_color@ctm-limited-range.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#4208] / [i915#2575]) -> [SKIP][367] ([Intel XE#306]) +2 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_chamelium_color@degamma.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#4208] / [i915#2575]) -> [SKIP][369] ([Intel XE#373]) +13 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][370] ([Intel XE#4208] / [i915#2575]) -> [SKIP][371] ([Intel XE#307])
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][372] ([Intel XE#2341]) -> [FAIL][373] ([Intel XE#1178])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_content_protection@legacy.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][374] ([Intel XE#1178]) -> [SKIP][375] ([Intel XE#4208] / [i915#2575])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_content_protection@legacy.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#4208] / [i915#2575]) -> [FAIL][377] ([Intel XE#1178]) +1 other test fail
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_content_protection@lic-type-0.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][378] ([Intel XE#1178]) -> [SKIP][379] ([Intel XE#2341]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_content_protection@srm.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#308]) -> [SKIP][381] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#4208] / [i915#2575]) -> [SKIP][383] ([Intel XE#308]) +2 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][384] ([Intel XE#323]) -> [SKIP][385] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#4208] / [i915#2575]) -> [SKIP][387] ([Intel XE#323])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#4208]) -> [SKIP][389] ([Intel XE#4356]) +1 other test skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_dp_link_training@uhbr-sst.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#4208]) -> [SKIP][391] ([Intel XE#4331])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][393] ([Intel XE#455]) +5 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#455]) -> [SKIP][395] ([Intel XE#4208]) +7 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#4208]) -> [SKIP][397] ([Intel XE#4422])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#4208]) -> [SKIP][399] ([Intel XE#776])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fbcon_fbt@psr.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#4208] / [i915#2575]) -> [SKIP][401] ([Intel XE#703])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_feature_discovery@display-3x.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#1138]) -> [SKIP][403] ([Intel XE#4208] / [i915#2575])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#1135]) -> [SKIP][405] ([Intel XE#4208] / [i915#2575])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_feature_discovery@psr1.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#455]) -> [SKIP][407] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#4208]) -> [SKIP][409] ([Intel XE#455]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][410] ([Intel XE#2312]) -> [SKIP][411] ([Intel XE#2311]) +10 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][412] ([Intel XE#2311]) -> [SKIP][413] ([Intel XE#2312]) +15 other tests skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][415] ([Intel XE#651]) +17 other tests skip
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][416] ([Intel XE#4141]) -> [SKIP][417] ([Intel XE#2312]) +5 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][418] ([Intel XE#2312]) -> [SKIP][419] ([Intel XE#4141]) +6 other tests skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#651]) -> [SKIP][421] ([Intel XE#4208]) +20 other tests skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#4208]) -> [SKIP][423] ([Intel XE#651]) +25 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#651]) -> [SKIP][425] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#4208]) -> [SKIP][427] ([Intel XE#653]) +31 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][428] ([Intel XE#2313]) -> [SKIP][429] ([Intel XE#2312]) +13 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#653]) -> [SKIP][431] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][432] ([Intel XE#2312]) -> [SKIP][433] ([Intel XE#2313]) +8 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][435] ([Intel XE#653]) +12 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][436] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][437] ([Intel XE#658])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1158]) -> [SKIP][439] ([Intel XE#4208])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#653]) -> [SKIP][441] ([Intel XE#4208]) +25 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][442] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][443] ([Intel XE#3544])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     [SKIP][444] ([Intel XE#4208]) -> [SKIP][445] ([Intel XE#2925]) +2 other tests skip
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#4359]) -> [SKIP][447] ([Intel XE#4208])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][449] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#4208] / [i915#2575]) -> [SKIP][451] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#4208]) -> [SKIP][453] ([Intel XE#870])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm_backlight@basic-brightness.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#2938]) -> [SKIP][455] ([Intel XE#4208])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#870]) -> [SKIP][457] ([Intel XE#4208])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_pm_backlight@fade.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#1122]) -> [SKIP][459] ([Intel XE#2351] / [Intel XE#4208])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     [SKIP][460] ([Intel XE#4208]) -> [SKIP][461] ([Intel XE#3309])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm_dc@dc5-retention-flops.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][463] ([Intel XE#1129])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm_dc@dc6-psr.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#4208] / [i915#2575]) -> [FAIL][465] ([Intel XE#5017])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_properties@get_properties-sanity-atomic.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#4208]) -> [SKIP][467] ([Intel XE#1489]) +11 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#1489]) -> [SKIP][469] ([Intel XE#4208]) +9 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][470] ([Intel XE#1122]) -> [SKIP][471] ([Intel XE#4208]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#4208]) -> [SKIP][473] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][474] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][475] ([Intel XE#4208]) +13 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][476] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][477] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_psr@pr-dpms.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][479] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#3414]) -> [SKIP][481] ([Intel XE#4208] / [i915#2575])
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#4208] / [i915#2575]) -> [SKIP][483] ([Intel XE#1127])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1127]) -> [SKIP][485] ([Intel XE#4208] / [i915#2575])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#455]) -> [SKIP][487] ([Intel XE#4208] / [i915#2575]) +7 other tests skip
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][488] ([Intel XE#2509]) -> [SKIP][489] ([Intel XE#2426])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#1500]) -> [SKIP][491] ([Intel XE#4208] / [i915#2575])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#4208] / [i915#2575]) -> [SKIP][493] ([Intel XE#455]) +12 other tests skip
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_vrr@flipline.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][494] ([Intel XE#4208] / [i915#2575]) -> [SKIP][495] ([Intel XE#756]) +2 other tests skip
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][496] ([Intel XE#756]) -> [SKIP][497] ([Intel XE#4208] / [i915#2575])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][498] ([Intel XE#4208] / [i915#2575]) -> [SKIP][499] ([Intel XE#1091] / [Intel XE#2849])
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][500] ([Intel XE#2705]) -> [SKIP][501] ([Intel XE#4208])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@testdisplay.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@testdisplay.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][502] ([Intel XE#4208]) -> [SKIP][503] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][504] ([Intel XE#1123]) -> [SKIP][505] ([Intel XE#4208])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#4208]) -> [SKIP][507] ([Intel XE#1123])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][508] ([Intel XE#4208]) -> [SKIP][509] ([Intel XE#1126])
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     [SKIP][510] ([Intel XE#1126]) -> [SKIP][511] ([Intel XE#4208])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0xfd.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#4497]) -> [SKIP][513] ([Intel XE#4208]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_eu_stall@invalid-event-report-count.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][514] ([Intel XE#4208]) -> [SKIP][515] ([Intel XE#4497]) +1 other test skip
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][516] ([Intel XE#4208]) -> [SKIP][517] ([Intel XE#4837]) +21 other tests skip
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#4837]) -> [SKIP][519] ([Intel XE#4208]) +17 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_eudebug@vma-ufence-faultable.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][520] ([Intel XE#1392]) -> [SKIP][521] ([Intel XE#4208]) +2 other tests skip
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-dg2-set2:     [SKIP][522] ([Intel XE#4208]) -> [SKIP][523] ([Intel XE#1392]) +3 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-rebind.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][524] ([Intel XE#288]) -> [SKIP][525] ([Intel XE#4208]) +26 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#4208]) -> [SKIP][527] ([Intel XE#288]) +38 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][528] ([Intel XE#4208]) -> [SKIP][529] ([Intel XE#2360])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-bmg:          [INCOMPLETE][530] ([Intel XE#2594]) -> [SKIP][531] ([Intel XE#4943])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][532] ([Intel XE#4915]) -> [SKIP][533] ([Intel XE#4208]) +188 other tests skip
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][534] ([Intel XE#4208]) -> [SKIP][535] ([Intel XE#4915]) +274 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [ABORT][536] -> [SKIP][537] ([Intel XE#4208])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][538] ([Intel XE#255]) -> [SKIP][539] ([Intel XE#4208])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_huc_copy@huc_copy.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][540] ([Intel XE#4208]) -> [SKIP][541] ([Intel XE#560])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_media_fill@media-fill.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#4208]) -> [SKIP][543] ([Intel XE#4501])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@buffer-size.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_oa@buffer-size.html

  * igt@xe_oa@invalid-remove-userspace-config:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][545] ([Intel XE#4208]) +5 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_oa@invalid-remove-userspace-config.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_oa@invalid-remove-userspace-config.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#4208]) -> [SKIP][547] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][548] ([Intel XE#4208]) -> [SKIP][549] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +2 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@syncs-userptr-wait-cfg.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#4208]) -> [SKIP][551] ([Intel XE#1337])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#977]) -> [SKIP][553] ([Intel XE#4208])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_pat@pat-index-xe2.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#979]) -> [SKIP][555] ([Intel XE#4208])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][556] ([Intel XE#4208]) -> [SKIP][557] ([Intel XE#2284] / [Intel XE#366]) +4 other tests skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][558] ([Intel XE#4208]) -> [SKIP][559] ([Intel XE#4650]) +1 other test skip
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pmu@fn-engine-activity-load.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#4208]) -> [SKIP][561] ([Intel XE#4733]) +4 other tests skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#4733]) -> [SKIP][563] ([Intel XE#4208]) +1 other test skip
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#944]) -> [SKIP][565] ([Intel XE#4208]) +3 other tests skip
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_query@multigpu-query-engines.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#4208]) -> [SKIP][567] ([Intel XE#944]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#4208]) -> [SKIP][569] ([Intel XE#4814])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#4208]) -> [SKIP][571] ([Intel XE#4821])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@selfconfig-basic:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#4130]) -> [SKIP][573] ([Intel XE#4208]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-basic.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#4273]) -> [SKIP][575] ([Intel XE#4208])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_sriov_flr@flr-twice.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#4208]) -> [SKIP][577] ([Intel XE#3342])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_sriov_flr@flr-vf1-clear.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4929
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f -> xe-pw-148868v2

  IGT_8362: 8362
  xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f: f28b1630b0e26e108cf5e2d9379bfed92dc4113f
  xe-pw-148868v2: 148868v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/index.html

--===============6575821724204023117==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reduce DPT table alignment as in i91=
5 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148868/">https://patchwork.freedesktop.org/series/148868/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148868v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148868v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3076-f28b1630b0e26e108cf5e2d9379bfed92=
dc4113f_FULL -&gt; xe-pw-148868v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148868v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148868v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1488=
68v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a=
-3-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14886=
8v2/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@=
pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-dp-2-4=
-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_async_flips@async-flip-wi=
th-page-flip-events-tiled@pipe-b-dp-2-4-rc-ccs.html">DMESG-WARN</a> +5 othe=
r tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_asyn=
c_flips@crc-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_flip=
s@crc-atomic@pipe-a-dp-2.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-4.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2=
/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hd=
mi-a-6-dp-4.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148868v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@fbdev@=
nullptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148868v2/shard-dg2-464/igt@fbdev@nullptr.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#21=
34</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-base:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@intel_=
sysfs_debugfs@xe-base.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@intel_sysfs_debugfs@x=
e-base.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a=
-1-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled@pipe-d-hdmi-a-1-x.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events-tile=
d@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg=
-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_flip=
s@crc-atomic@pipe-c-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) +6 other tests =
dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@kms_async_=
flips@crc-atomic@pipe-c-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4677">Intel XE#4677</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 ot=
her tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@kms_async_flips@c=
rc@pipe-d-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@kms_ato=
mic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adl=
p-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908=
">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_big_fb@linear-8bpp-rotate=
-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_ccs@bad-rotation-90-4-ti=
led-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd-with=
-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_content_protection@legacy=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_cursor_crc@cursor-onscr=
een-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +38 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@kms_dither@fb-8bpc-v=
s-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_dp_linktrai=
n_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard=
-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.=
html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-=
dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip@2x-plain-=
flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +94 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-2/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-8/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fl=
ip@plain-flip-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_flip@plain-flip-=
ts-check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-hdmi-a2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_flip@plain-flip-ts-chec=
k@a-hdmi-a2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-dg2-463/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap=
-wc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc=
-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-4=
64/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-linear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_hdr@static-swap.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_plane_multiple@2x-tiling=
-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling@pipe-b.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-3/igt@kms_setm=
ode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-4/igt@kms_setmode@basic@pipe=
-b-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_setmode@invalid-clone-sin=
gle-crtc-stealing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_se=
tmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-4.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2=
/shard-dg2-463/igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hd=
mi-a-6-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@kms_vbl=
ank@wait-forked-hang.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@kms_vblank@wait-forked-=
hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_compute_preempt@compute-p=
reempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_eudebug_online@breakpoint=
-many-sessions-single-tile.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-ex=
ec-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_exe=
c_basic@multigpu-once-null-rebind.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_exec_b=
asic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_exec=
_reset@cm-close-fd.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_exec_reset@cm-close-fd=
.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_exec_system_allocator@many=
-large-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-busy-n=
omemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-malloc-busy-nomemset.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>=
) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148868v2/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-=
new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4929">Intel XE#4929</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_liv=
e_ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_live_ktest@xe_bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"=
>Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_liv=
e_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_live_=
ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-7/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/sha=
rd-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4=
113f/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed9=
2dc4113f/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379b=
fed92dc4113f/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9=
379bfed92dc4113f/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5=
e2d9379bfed92dc4113f/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e10=
8cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e2=
6e108cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630=
b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b=
1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-=
f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/sh=
ard-bmg-8/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module=
_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@r=
eload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_oa@oa-tlb-invalidate.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_pm@s=
4-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">=
Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-7/igt@xe_pm@s4=
-d3hot-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148868v2/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@xe_pxp@pxp-src-to-pxp-dest-re=
ndercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_vm@large-split-binds-536=
870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>) +178 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_vm@=
munmap-style-unbind-many-either-side-partial.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@xe_vm@munmap-style-unbind-many-either-side-partial.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +202 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@fbdev@read.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-on:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-on.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618=
">Intel XE#4618</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-a=
ll-entries-display-on.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/=
igt@kms_async_flips@invalid-async-flip.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/igt@k=
ms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#=
3321</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@a=
b-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_flip=
@2x-plain-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@kms_flip@2x-plai=
n-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@kms_hdm=
i_inject@inject-audio.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@kms_hdmi_inject@injec=
t-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_hd=
r@invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@kms_hdr@invalid-h=
dr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_hdr@=
static-toggle-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-2/igt@kms_hdr@stat=
ic-toggle-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-dg2-463/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">=
PASS</a> +124 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +270 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2=
-463/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel=
 XE#4792</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148868v2/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-9/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-4/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-4/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-ad=
lp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/sha=
rd-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113=
f/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92d=
c4113f/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bf=
ed92dc4113f/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9=
379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf=
5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e=
108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b=
0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b=
1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076=
-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-1/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-adlp-2/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113=
f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92d=
c4113f/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bf=
ed92dc4113f/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9=
379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf=
5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e=
108cf5e2d9379bfed92dc4113f/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148868v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-a=
dlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148868v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v2/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sh=
ard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-9/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148868v2/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-8/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868=
v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adl=
p-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-adlp-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148868v2/shard-adlp-3/igt@xe_module_load@load.html">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shar=
d-adlp-3/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f=
/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92d=
c4113f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379b=
fed92dc4113f/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e=
2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e1=
08cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b=
0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28=
b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-30=
76-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-d=
g2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/s=
hard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4=
113f/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfe=
d92dc4113f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9=
379bfed92dc4113f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108c=
f5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e2=
6e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b16=
30b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-=
f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-46=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sh=
ard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148868v2/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-4=
32/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148868v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-=
466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v2/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/=
shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_module_=
load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_mod=
ule_load@reload.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_module_loa=
d@reload.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-=
464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shar=
d-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt=
@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_bi=
g_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2=
/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt=
@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-=
dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel X=
E#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#11=
24</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v2/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-a=
sync-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148868v2/shard-dg2-433/igt@kms_bw@connected-linear-tiling-4-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-46=
4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_bw=
@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shar=
d-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v2/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-=
rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard=
-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-=
432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868=
v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_cham=
elium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +13 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_ch=
amelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt=
@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-4=
32/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/37=
3">Intel XE#373</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sh=
ard-dg2-466/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-7/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard=
-dg2-432/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-6/igt@kms_content_=
protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/=
shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_cu=
rsor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/=
shard-dg2-464/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_cursor_legac=
y@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">In=
tel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_dp=
_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_d=
p_link_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_dp=
_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/=
igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-=
463/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_ds=
c@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/=
shard-dg2-433/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_fbcon_fbt@psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-=
dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@km=
s_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148868v2/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32=
bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148868v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/s=
hard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#65=
1</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2=
0 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primsc=
rn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur=
-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/653">Intel XE#653</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148868v2/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-sp=
r-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v=
2/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v=
2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel=
 XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt=
@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +25 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-8/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_jo=
iner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">=
Intel XE#2925</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_pi=
pe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel X=
E#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-=
factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-148868v2/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-=
factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@k=
ms_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_pm_backligh=
t@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_pm=
_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_=
pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm=
_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@kms_p=
m_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pm=
_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms=
_pm_dc@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_pr=
operties@get_properties-sanity-atomic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v2/shard-dg2-432/igt@kms_properties@get_properties-sanity-atomic.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017=
">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148868v2/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_ps=
r2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2=
/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ps=
r@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@km=
s_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard=
-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@kms_p=
sr@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@kms_ro=
tation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@kms_rot=
ation_crc@bad-tiling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-=
dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_sc=
aling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-46=
4/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-1/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/sha=
rd-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2=
-433/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@sriov_=
basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v2/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvf=
s-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@testdi=
splay.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2705">Intel XE#2705</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@testdisplay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432=
/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel X=
E#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_cop=
y_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@x=
e_copy_basic@mem-set-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_eu_sta=
ll@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4497">Intel XE#4497</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-4=
32/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a=
>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_eud=
ebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_=
eudebug@vma-ufence-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +17 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-=
dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/=
igt@xe_exec_basic@multigpu-no-exec-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-re=
bind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2=
-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288<=
/a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg=
2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2=
360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-bmg-5/igt@xe_exec_=
system_allocator@many-execqueues-mmap-new-huge.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#259=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
868v2/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-new-hug=
e.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_exe=
c_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_exec_system_allocator@threads-=
many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1=
88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v2/shard-dg2-466/igt@xe_exec_system_allocator@threads-shared-vm-many-l=
arge-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +274 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-46=
4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_med=
ia_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_media_f=
ill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-remove-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_oa@=
invalid-remove-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/s=
hard-dg2-464/igt@xe_oa@invalid-remove-userspace-config.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-436/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_pat@pat-index=
-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_pat@pat-ind=
ex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-433/igt@xe_pm@d3col=
d-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-432/igt@xe_pxp=
@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt=
@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-466/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-4=
33/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-432/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-463/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-433/igt@xe_sri=
ov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2=
-464/igt@xe_sriov_auto_provisioning@selfconfig-basic.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-463/igt@xe_sri=
ov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4273">Intel XE#4273</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-464/igt@xe_sriov_flr=
@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/shard-dg2-464/igt@xe_sri=
ov_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/shard-dg2-466/igt@xe_sriov=
_flr@flr-vf1-clear.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f -&gt; xe-pw-148=
868v2</li>
</ul>
<p>IGT_8362: 8362<br />
  xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f: f28b1630b0e26e108cf5e2d=
9379bfed92dc4113f<br />
  xe-pw-148868v2: 148868v2</p>

</body>
</html>

--===============6575821724204023117==--
