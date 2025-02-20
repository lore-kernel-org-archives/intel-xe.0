Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BC8C021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 08:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F6510E181;
	Thu, 20 Feb 2025 08:18:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C540710E181;
 Thu, 20 Feb 2025 08:18:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3877262353654173840=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_Allow_?=
 =?utf-8?q?display_PHYs_to_reset_power_state_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 08:18:06 -0000
Message-ID: <174003948679.139217.9748129746968441497@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218100019.740556-1-mika.kahola@intel.com>
In-Reply-To: <20250218100019.740556-1-mika.kahola@intel.com>
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

--===============3877262353654173840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Allow display PHYs to reset power state (rev5)
URL   : https://patchwork.freedesktop.org/series/144103/
State : failure

== Summary ==

CI Bug Log - changes from xe-2680-4587c05996666a92af63f86ba410bae1dc940794_full -> xe-pw-144103v5_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144103v5_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144103v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144103v5_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-dg2-set2:     [DMESG-WARN][5] ([Intel XE#4330]) -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  
Known issues
------------

  Here are the changes found in xe-pw-144103v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [ABORT][7] ([Intel XE#3914])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][8] ([Intel XE#4330]) +2 other tests dmesg-fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] ([Intel XE#4330]) +13 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#787]) +35 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][13] ([Intel XE#4330]) +11 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#3442])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#787]) +8 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#314])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#373]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#1178])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][22] -> [SKIP][23] ([Intel XE#309]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2291]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#1340])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#3009])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_dp_aux_dev.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_dp_aux_dev.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#702])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_feature_discovery@display-2x.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][32] -> [FAIL][33] ([Intel XE#3321]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][34] ([Intel XE#301]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-modeset:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#310]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_flip@2x-flip-vs-modeset.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#310])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][38] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][41] -> [FAIL][42] ([Intel XE#301]) +5 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#301]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][45] ([Intel XE#301] / [Intel XE#3321]) +2 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][46] ([Intel XE#4330])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][47] -> [FAIL][48] ([Intel XE#886]) +2 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][49] -> [FAIL][50] ([Intel XE#2882]) +1 other test fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][51] -> [DMESG-FAIL][52] ([Intel XE#4330]) +1 other test dmesg-fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#651]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#651])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#656]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [PASS][56] -> [SKIP][57] ([Intel XE#656]) +5 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#653])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#346])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#3012])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-dg2-set2:     [PASS][62] -> [SKIP][63] ([Intel XE#4328])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#2925])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-3-size-256:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][65] ([Intel XE#4330])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-3-size-256.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - shard-adlp:         NOTRUN -> [FAIL][66] ([Intel XE#1874]) +3 other tests fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
    - shard-bmg:          [PASS][67] -> [DMESG-WARN][68] ([Intel XE#877]) +1 other test dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-bmg:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#2566])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1489])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-basic:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@basic:
    - shard-lnl:          [PASS][73] -> [FAIL][74] ([Intel XE#2883]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-4/igt@kms_setmode@basic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-3/igt@kms_setmode@basic.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#455]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1123])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#3889])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#2905]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1392]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#288]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][81] -> [INCOMPLETE][82] ([Intel XE#1169])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-adlp:         [PASS][83] -> [DMESG-WARN][84] ([Intel XE#4173])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][85] -> [DMESG-WARN][86] ([Intel XE#4330]) +4 other tests dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#977])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_pat@pat-index-xe2.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#944])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     NOTRUN -> [ABORT][89] ([Intel XE#3075] / [Intel XE#3084])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][90] ([Intel XE#4330]) -> [PASS][91] +3 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-adlp:         [DMESG-WARN][92] -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][94] ([Intel XE#4330]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][96] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][98] ([Intel XE#2191]) -> [PASS][99] +2 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][100] -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#2705]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][104] ([Intel XE#877]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [SKIP][106] ([Intel XE#309]) -> [PASS][107] +3 other tests pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][108] ([Intel XE#2291]) -> [PASS][109]
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          [SKIP][110] ([Intel XE#4294]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-dg2-set2:     [SKIP][112] ([Intel XE#310]) -> [PASS][113] +8 other tests pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][114] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][115] +1 other test pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][116] ([Intel XE#301]) -> [PASS][117] +3 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][118] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][119] +1 other test pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][120] ([Intel XE#2316]) -> [PASS][121] +6 other tests pass
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][122] ([Intel XE#4330]) -> [PASS][123] +14 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#656]) -> [PASS][125] +8 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-adlp:         [DMESG-WARN][126] ([Intel XE#2953]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:
    - shard-dg2-set2:     [DMESG-WARN][128] ([Intel XE#2566]) -> [PASS][129] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#836]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][132] ([Intel XE#2883]) -> [PASS][133] +4 other tests pass
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_setmode@basic.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][134] ([Intel XE#1435]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][136] ([Intel XE#899]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#4330]) -> [PASS][139] +9 other tests pass
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html

  * igt@xe_evict@evict-beng-small-cm:
    - shard-bmg:          [DMESG-WARN][140] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@xe_evict@evict-beng-small-cm.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@xe_evict@evict-beng-small-cm.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [DMESG-WARN][142] ([Intel XE#4173]) -> [PASS][143] +7 other tests pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-lnl:          [INCOMPLETE][144] -> [ABORT][145] ([Intel XE#3914])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-WARN][146] -> [DMESG-FAIL][147] ([Intel XE#4330])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#787]) -> [SKIP][149] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][151] ([Intel XE#787]) +11 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [FAIL][152] ([Intel XE#4297]) -> [SKIP][153] ([Intel XE#314])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_color@ctm-signed:
    - shard-bmg:          [DMESG-WARN][154] ([Intel XE#4330] / [Intel XE#877]) -> [DMESG-WARN][155] ([Intel XE#4330])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_color@ctm-signed.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][156] ([Intel XE#2341]) -> [FAIL][157] ([Intel XE#1178])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_content_protection@atomic.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][158] ([Intel XE#1178]) -> [SKIP][159] ([Intel XE#2341])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#1178]) -> [SKIP][161] ([Intel XE#455])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_content_protection@legacy.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][162] ([Intel XE#1178]) -> [INCOMPLETE][163] ([Intel XE#4132])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][164] ([Intel XE#3304]) -> [INCOMPLETE][165] ([Intel XE#4132])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#1188]) -> [SKIP][167] ([Intel XE#455])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_content_protection@uevent.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [SKIP][168] ([Intel XE#310]) -> [DMESG-FAIL][169] ([Intel XE#4330])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#310]) -> [DMESG-WARN][171] ([Intel XE#2955]) +1 other test dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [FAIL][172] ([Intel XE#2882]) -> [SKIP][173] ([Intel XE#2316])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#310]) -> [DMESG-WARN][175] ([Intel XE#4330]) +1 other test dmesg-warn
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][176] ([Intel XE#4330]) -> [FAIL][177] ([Intel XE#301])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#651]) -> [SKIP][179] ([Intel XE#656]) +15 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][180] ([Intel XE#2312]) -> [SKIP][181] ([Intel XE#2311]) +11 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][182] ([Intel XE#2311]) -> [SKIP][183] ([Intel XE#2312]) +13 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#656]) -> [SKIP][185] ([Intel XE#651]) +18 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][186] ([Intel XE#4330]) -> [SKIP][187] ([Intel XE#656])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][188] ([Intel XE#2312]) -> [SKIP][189] ([Intel XE#4141]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][190] ([Intel XE#4141]) -> [SKIP][191] ([Intel XE#2312]) +8 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#653]) -> [SKIP][193] ([Intel XE#656]) +14 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][194] ([Intel XE#2312]) -> [SKIP][195] ([Intel XE#2313]) +10 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#656]) -> [SKIP][197] ([Intel XE#653]) +17 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][198] ([Intel XE#2313]) -> [SKIP][199] ([Intel XE#2312]) +14 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][200] ([Intel XE#3544]) -> [SKIP][201] ([Intel XE#3374] / [Intel XE#3544])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#362]) -> [FAIL][203] ([Intel XE#1729])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][204] -> [SKIP][205] ([Intel XE#2833])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][206] ([Intel XE#4054]) -> [ABORT][207] ([Intel XE#4268])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@xe_pm@s4-vm-bind-userptr.html

  
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4297
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-2680-4587c05996666a92af63f86ba410bae1dc940794 -> xe-pw-144103v5

  IGT_8236: 8236
  xe-2680-4587c05996666a92af63f86ba410bae1dc940794: 4587c05996666a92af63f86ba410bae1dc940794
  xe-pw-144103v5: 144103v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/index.html

--===============3877262353654173840==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Allow display PHYs to reset power state (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144103/">https://patchwork.freedesktop.org/series/144103/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2680-4587c05996666a92af63f86ba410bae1dc940794_full -&gt; xe-pw-144103v5_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144103v5_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144103v5_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144103v5_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing@pipe-a-hdmi-a-6.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@xe_live_ktest@xe_mocs.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144103v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +13 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +11 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_flip@2x-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_flip@2x-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_flip@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-dp4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-7/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-3-size-256:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_plane_cursor@overlay@pipe-d-hdmi-a-3-size-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-4/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-3/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-8/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-4/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_color@ctm-signed@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_dp_linktrain_fallback@dp-fallback.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@bd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_pm_rpm@dpms-non-lpsp.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-3.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@xe_evict@evict-beng-small-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@xe_evict@evict-beng-small-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-lnl-7/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-lnl-5/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4297">Intel XE#4297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-8/igt@kms_color@ctm-signed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_color@ctm-signed.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_content_protection@lic-type-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-434/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-463/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-2/igt@kms_flip@2x-plain-flip-ts-check.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-bmg-4/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2680-4587c05996666a92af63f86ba410bae1dc940794/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054">Intel XE#4054</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v5/shard-adlp-3/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2680-4587c05996666a92af63f86ba410bae1dc940794 -&gt; xe-pw-144103v5</li>
</ul>
<p>IGT_8236: 8236<br />
  xe-2680-4587c05996666a92af63f86ba410bae1dc940794: 4587c05996666a92af63f86ba410bae1dc940794<br />
  xe-pw-144103v5: 144103v5</p>

</body>
</html>

--===============3877262353654173840==--
